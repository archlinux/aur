# Maintainer: MicLeh <micleh at proton dot me>
pkgname=cornelsen-offline-lernen-bin
pkgver=37.10.2
# App version 2026.8.1 from 2026-05-07
pkgrel=6
pkgdesc="Cornelsen Offline Lernen Electron App"
arch=('x86_64')
url="https://www.cornelsen.de"
license=('custom')
depends=('electron')
makedepends=('npm')
source=("${pkgname}-${pkgver}.zip::https://ebook.cornelsen.de/uma20/public/v2/uma/offline/win"
        "${pkgname}.sh"
        "${pkgname}.desktop"
        "icon16.png"
        "icon32.png"
        "icon96.png")
b2sums=('8b52436903c17985c8c68ad6efb560fc55fa37cc76081fe51ed783895760d9c60214caafba6206ac914ecd934c8d91aaad875ed2424dfac643e4516379ed6ac7'
        '2f1c802ebb340472a192316bdd9a7834dcb9e205e6a5fb186684c6142efc1033ff76c7238e9753b0bfa3f2daccebce6c709332b38b4a84440ffb42f316373531'
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
    local _asar_path
    _asar_path="$(_find_asar_path || true)"

    if [ -z "$_asar_path" ] || [ ! -f "$_asar_path" ]; then
                echo "ERROR: source app.asar not found in extracted zip"
                exit 1
        fi

        local _tmp_base _tmp_dir
        _tmp_base="${TMPDIR:-/var/tmp}"
        if [ ! -w "$_tmp_base" ]; then
            _tmp_base="$PWD"
        fi
        _tmp_dir="$(mktemp -d "$_tmp_base/${pkgname}.asar.XXXXXX")"

        npx --yes @electron/asar extract "$_asar_path" "$_tmp_dir"

        node - "$_tmp_dir" <<'NODE'
const fs = require('fs');
const path = require('path');
const root = process.argv[2];

function collectJsFiles(dir, out = []) {
    for (const ent of fs.readdirSync(dir, { withFileTypes: true })) {
        const p = path.join(dir, ent.name);
        if (ent.isDirectory()) {
            collectJsFiles(p, out);
        } else if (ent.isFile() && ent.name.endsWith('.js')) {
            out.push(p);
        }
    }
    return out;
}

const distDir = path.join(root, 'dist');
if (!fs.existsSync(distDir)) {
    console.error('ERROR: unpacked asar does not contain a dist directory');
    process.exit(1);
}

const jsFiles = collectJsFiles(distDir);

const verbose = process.env.CORNELSEN_PATCH_VERBOSE === '1';
const strict = process.env.CORNELSEN_PATCH_STRICT === '1';

const patches = [
    {
        name: 'annotations-404-fallback',
        regex: /getProductAnnotations\(r,s=!1\)\{return this\.http\.get\(`\$\{s\?os\.getSyncApiBaseUrl\(\):os\.getApiBaseUrl\(\)\}\/pspdf\/annotations\/\$\{r\}`\)\.pipe\(/g,
        replaceWith: 'getProductAnnotations(r,s=!1){return this.http.get(`${s?os.getSyncApiBaseUrl():os.getApiBaseUrl()}/pspdf/annotations/${r}`).pipe(ip(y=>s&&y.status===404?hs({}):r0(()=>y)),',
        from: 'getProductAnnotations(r,s=!1){return this.http.get(`${s?os.getSyncApiBaseUrl():os.getApiBaseUrl()}/pspdf/annotations/${r}`).pipe(ip(y=>r0(()=>y)),Jl(y=>this.mapOfflinePdfIds(y)))}',
        fromAlt: 'getProductAnnotations(r,s=!1){return this.http.get(`${s?ls.getSyncApiBaseUrl():ls.getApiBaseUrl()}/pspdf/annotations/${r}`).pipe(nc(y=>this.mapOfflinePdfIds(y)))}',
        toAlt: 'getProductAnnotations(r,s=!1){return this.http.get(`${s?ls.getSyncApiBaseUrl():ls.getApiBaseUrl()}/pspdf/annotations/${r}`).pipe(op(y=>s&&y.status===404?fs({}):r0(()=>y)),nc(y=>this.mapOfflinePdfIds(y)))}',
        fromAlt2: 'getProductAnnotations(r,s=!1){return this.http.get(`${s?cs.getSyncApiBaseUrl():cs.getApiBaseUrl()}/pspdf/annotations/${r}`).pipe(nc(y=>this.mapOfflinePdfIds(y)))}',
        toAlt2: 'getProductAnnotations(r,s=!1){return this.http.get(`${s?cs.getSyncApiBaseUrl():cs.getApiBaseUrl()}/pspdf/annotations/${r}`).pipe(op(y=>s&&y.status===404?Es({}):r0(()=>y)),nc(y=>this.mapOfflinePdfIds(y)))}',
        to: 'getProductAnnotations(r,s=!1){return this.http.get(`${s?os.getSyncApiBaseUrl():os.getApiBaseUrl()}/pspdf/annotations/${r}`).pipe(ip(y=>s&&y.status===404?hs({}):r0(()=>y)),Jl(y=>this.mapOfflinePdfIds(y)))}',
        alreadyMarker: 's&&y.status===404?hs({}):r0(()=>y)',
        alreadyMarker2: 's&&y.status===404?Es({}):r0(()=>y)',
        required: false
    },
    {
        name: 'compatibility-401-fallback',
        from: 'isCompatibleWithOnline$(){return this.http.get(`${os.getSyncApiBaseUrl()}/compatibility/offlineClients/${GE}`).pipe(sa(r=>r.isCompatible))}',
        fromAlt: 'isCompatibleWithOnline$(){return this.http.get(`${ls.getSyncApiBaseUrl()}/compatibility/offlineClients/${qE}`).pipe(sa(r=>r.isCompatible))}',
        toAlt: 'isCompatibleWithOnline$(){return this.http.get(`${ls.getSyncApiBaseUrl()}/compatibility/offlineClients/${qE}`).pipe(sa(r=>r.isCompatible),op(r=>r.status===401?fs(!0):r0(()=>r)))}',
        fromAlt2: 'isCompatibleWithOnline$(){return this.http.get(`${cs.getSyncApiBaseUrl()}/compatibility/offlineClients/${ZE}`).pipe(sa(r=>r.isCompatible))}',
        toAlt2: 'isCompatibleWithOnline$(){return this.http.get(`${cs.getSyncApiBaseUrl()}/compatibility/offlineClients/${ZE}`).pipe(sa(r=>r.isCompatible),op(r=>r.status===401?Es(!0):r0(()=>r)))}',
        to: 'isCompatibleWithOnline$(){return this.http.get(`${os.getSyncApiBaseUrl()}/compatibility/offlineClients/${GE}`).pipe(sa(r=>r.isCompatible),ip(r=>r.status===401?hs(!0):r0(()=>r)))}',
        alreadyMarker: 'r.status===401?hs(!0):r0(()=>r)',
        alreadyMarker2: 'r.status===401?Es(!0):r0(()=>r)',
        required: false
    }
];

for (const p of patches) {
    let patched = false;

    for (const filePath of jsFiles) {
        let txt = fs.readFileSync(filePath, 'utf8');

        if (txt.includes(p.to) || (p.toAlt && txt.includes(p.toAlt)) || (p.toAlt2 && txt.includes(p.toAlt2)) || txt.includes(p.alreadyMarker) || (p.alreadyMarker2 && txt.includes(p.alreadyMarker2))) {
            patched = true;
            break;
        }

        if (p.regex && p.regex.test(txt)) {
            txt = txt.replace(p.regex, p.replaceWith);
            fs.writeFileSync(filePath, txt);
            patched = true;
            break;
        }

        if (txt.includes(p.from)) {
            txt = txt.replace(p.from, p.to);
            fs.writeFileSync(filePath, txt);
            patched = true;
            break;
        }

        if (p.fromAlt && p.toAlt && txt.includes(p.fromAlt)) {
            txt = txt.replace(p.fromAlt, p.toAlt);
            fs.writeFileSync(filePath, txt);
            patched = true;
            break;
        }

        if (p.fromAlt2 && p.toAlt2 && txt.includes(p.fromAlt2)) {
            txt = txt.replace(p.fromAlt2, p.toAlt2);
            fs.writeFileSync(filePath, txt);
            patched = true;
            break;
        }
    }

    if (!patched) {
        if (p.required || strict) {
            console.error(`ERROR: required patch target not found: ${p.name}`);
            process.exit(1);
        }

        if (verbose) {
            console.warn(`INFO: optional patch target not found: ${p.name} (continuing)`);
        }
    }
}
NODE

        npx --yes @electron/asar pack "$_tmp_dir" "$_asar_path"
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
