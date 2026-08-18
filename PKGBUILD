# Maintainer: Vitaliy VVS Star <vitaliy <dot> star <at> Gmail-DOT-Com>

pkgname=nanobot-ai-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Python framework for building personal AI agents with tools, memory and WebUI"
arch=('x86_64')
url="https://github.com/HKUDS/nanobot"
license=('MIT')
depends=('python')
provides=('nanobot-ai')
conflicts=('nanobot-ai')
options=('!strip' '!emptydirs')
install="$pkgname.install"
noextract=("nanobot_ai-${pkgver}-py3-none-any.whl")
source=("nanobot_ai-${pkgver}-py3-none-any.whl::https://files.pythonhosted.org/packages/f6/66/27c946147a2e9d0f2e00507e475edcb19a73d09e3061dbd4ef05059f7cdf/nanobot_ai-${pkgver}-py3-none-any.whl")
sha256sums=('fb24fa5754661a2704d3b04f592ca7536be83caff062ef2b47989e867129cbe0')

_appdir=/usr/lib/nanobot-ai

build() {
    python -m venv "$srcdir/venv"
    PIP_CACHE_DIR="$srcdir/pip-cache" "$srcdir/venv/bin/pip" install --no-input \
        "$srcdir/nanobot_ai-${pkgver}-py3-none-any.whl"
}

check() {
    HOME="$srcdir" "$srcdir/venv/bin/nanobot" --help >/dev/null
}

package() {
    install -dm755 "$pkgdir$_appdir"
    cp -a "$srcdir/venv" "$pkgdir$_appdir/venv"

    # venvs are not relocatable: rewrite absolute build paths to the install location
    find "$pkgdir$_appdir/venv/bin" -maxdepth 1 -type f \
        -exec sed -i "s|$srcdir/venv|$_appdir/venv|g" {} +
    rm -f "$pkgdir$_appdir/venv/lib/python"*/site-packages/nanobot_ai-${pkgver}.dist-info/direct_url.json

    # drop CPython 3.14's novelty unicode "𝜋thon" venv alias (breaks bsdtar in C locale)
    find "$pkgdir$_appdir/venv/bin" -maxdepth 1 -type l ! -name 'python*' -delete

    install -dm755 "$pkgdir/usr/bin"
    ln -s "$_appdir/venv/bin/nanobot" "$pkgdir/usr/bin/nanobot"

    # License and third-party notices from the wheel
    python - <<EOF
import pathlib, zipfile
z = zipfile.ZipFile("$srcdir/nanobot_ai-${pkgver}-py3-none-any.whl")
out = pathlib.Path("$pkgdir/usr/share/licenses/$pkgname")
out.mkdir(parents=True, exist_ok=True)
(out / "LICENSE").write_bytes(z.read("nanobot_ai-${pkgver}.dist-info/licenses/LICENSE"))
(out / "THIRD_PARTY_NOTICES.md").write_bytes(
    z.read("nanobot_ai-${pkgver}.dist-info/licenses/THIRD_PARTY_NOTICES.md"))
EOF
}
