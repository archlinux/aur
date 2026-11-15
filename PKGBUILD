# Maintainer: MicLeh <micleh at proton dot me>
pkgname=cornelsen-offline-lernen-bin
pkgver=44.0.0
# App version 2026.21.1 (Electron 44.0.0), checked 2026-11-15
pkgrel=1
pkgdesc="Cornelsen Offline Lernen Electron App"
arch=('x86_64')
url="https://www.cornelsen.de"
license=('custom')
depends=('electron44')
makedepends=('asar' 'nodejs')
source=("${pkgname}-${pkgver}.zip::https://ebook.cornelsen.de/uma20/public/v2/uma/offline/win"
        "${pkgname}.sh"
        "${pkgname}.desktop"
        "icon16.png"
        "icon32.png"
        "icon96.png")
b2sums=('929c3cb2fc550d2e7f7ade888e65a0153028a1c351f66e0eb5f89252200bc5062d81044217a17f3045302f36ea0a9ebf854634e2c16332f743b94fd502cf69c5'
        'afc1954a7e84a27b50976fbb702523f114905189032ae914cb659ff58c2054bd2935680015f63644f81d79b8c5d48ec8610a29652b9c326841df5373a203348e'
        '8157b061d35da630252a8c402a98fb978fcad59fcfa813eb8b67dfeaae7e467051d659201e55b5d1811ae15eca49e47189a5a9840277f09876cf1d7021cfc1da'
        '8dd68d9cd90347b954da9280d2133bc45706eec1e74261bdf19f53b61150ee5168db20a0f217643230c4dc66fb840f9ef61fce5f6aff5853b1bebae4bc9f4c65'
        'b326c7f468c3cecb0e2618bae56092b7c6c5fa7e8f43f499645df01c2b468e74052bef51d48b36a8a7ade2fa12f9612591eaf38819998868271ec23abd366ad5'
        '302bef8514b991cb6903d2def32abf348329a1cf104009b3c50c0e83e44b15103b89f669fb2012894df0c7d6ab926151f09e0cf61aff4102296be7071f66f794')

_find_asar_path() {
    local _path
    local _candidates=(
        "src/windows/resources/app.asar"
        "src/src/windows/resources/app.asar"
        "windows/resources/app.asar"
        "resources/app.asar"
    )

    for _path in "${_candidates[@]}"; do
        if [ -f "$_path" ]; then
            printf '%s\n' "$_path"
            return 0
        fi
    done

    _path="$(find . -type f -path '*/resources/app.asar' | head -n 1)"
    if [ -n "$_path" ]; then
        printf '%s\n' "${_path#./}"
        return 0
    fi

    return 1
}

prepare() {
    local _asar_path _tmp_dir
    _asar_path="$(_find_asar_path)" || { echo "ERROR: source app.asar not found in extracted zip"; exit 1; }
    _tmp_dir="$(mktemp -d "${TMPDIR:-/var/tmp}/${pkgname}.asar.XXXXXX")"

    asar extract "$_asar_path" "$_tmp_dir"

    # Patch: the offline client asks the sync API whether it is still
    # compatible; without a valid session that request fails with 401 and the
    # app blocks synchronization ("incompatible with online"). The patch treats
    # 401 as compatible. The code is minified and the RxJS operator names
    # change with every release, so catchError, of and throwError are found by
    # their implementation instead of being hard-coded.
    node - "$_tmp_dir/dist" <<'NODE'
const fs = require('fs');
const path = require('path');
const dist = process.argv[2];
const strict = process.env.CORNELSEN_PATCH_STRICT === '1';
const id = '[\\w$]+';

const target = /(isCompatibleWithOnline\$\(\)\{return this\.http\.get\(`[^`]*`\)\.pipe\()(.*?\.isCompatible\)+)\)\}/;
const ops = {
    catchError: new RegExp(`function (${id})\\((${id})\\)\\{return ${id}\\(\\((${id}),(${id})\\)=>\\{let (${id})=null,(${id})=!1,(${id});\\5=\\3\\.subscribe`),
    of: new RegExp(`function (${id})\\(\\.\\.\\.(${id})\\)\\{return (${id})\\(\\2,(${id})\\(\\2\\)\\)\\}`),
    throwError: new RegExp(`function (${id})\\((${id}),(${id})\\)\\{let (${id})=${id}\\(\\2\\)\\?\\2:\\(\\)=>\\2,(${id})=(${id})=>\\6\\.error\\(\\4\\(\\)\\)`),
};

function fail(msg) {
    console.error(`${strict ? 'ERROR' : 'WARNING'}: ${msg}`);
    process.exit(strict ? 1 : 0);
}

const file = fs.readdirSync(dist).filter(f => f.endsWith('.js')).map(f => path.join(dist, f))
    .find(f => target.test(fs.readFileSync(f, 'utf8')));
if (!file) fail('compatibility-401-fallback: isCompatibleWithOnline$ not found, app not patched');

let js = fs.readFileSync(file, 'utf8');
const names = {};
for (const [op, re] of Object.entries(ops)) {
    const m = js.match(re);
    if (!m) fail(`compatibility-401-fallback: RxJS ${op} not found in ${path.basename(file)}, app not patched`);
    names[op] = m[1];
}
js = js.replace(target, (_, head, body) =>
    `${head}${body},${names.catchError}(e=>e.status===401?${names.of}(!0):${names.throwError}(()=>e)))}`);
fs.writeFileSync(file, js);
console.log(`patched compatibility-401-fallback in ${path.basename(file)} ` +
    `(catchError=${names.catchError}, of=${names.of}, throwError=${names.throwError})`);
NODE

    asar pack "$_tmp_dir" "$_asar_path"
    rm -rf "$_tmp_dir"
}

package() {
    local _asar_path
    _asar_path="$(_find_asar_path || true)"

    if [ ! -f "$_asar_path" ]; then
        echo "ERROR: app.asar not found"
        exit 1
    fi

    install -Dm644 "$_asar_path" "$pkgdir/usr/share/$pkgname/app.asar"
    install -Dm755 "${pkgname}.sh" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
    
    # Icons
    install -Dm644 "icon16.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/${pkgname}.png"
    install -Dm644 "icon32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/${pkgname}.png"
    install -Dm644 "icon96.png" "$pkgdir/usr/share/icons/hicolor/96x96/apps/${pkgname}.png"
    
    # Licenses
    _license=$(find . -name "LICENSE" | head -n 1)
    if [ -n "$_license" ]; then
        install -Dm644 "$_license" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
