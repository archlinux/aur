# Maintainer: Vitaliy VVS Star <vitaliy <dot> star <at> Gmail-DOT-Com>

pkgname=nanobot-ai-bin
pkgver=0.4.1
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
_wheel="nanobot_ai-${pkgver}-py3-none-manylinux_2_17_x86_64.whl"
noextract=("$_wheel")
source=("$_wheel::https://files.pythonhosted.org/packages/27/47/972e61cfb71ed6f2393f93a0034348667973f8820a938e3cfd8a06200be0/nanobot_ai-${pkgver}-py3-none-manylinux_2_17_x86_64.whl")
sha256sums=('5eadd2f105481965e83f37e808593bc4cc8efcf81adb646abc01598afc2fe0de')

_appdir=/usr/lib/nanobot-ai

build() {
    python -m venv "$srcdir/venv"
    PIP_CACHE_DIR="$srcdir/pip-cache" "$srcdir/venv/bin/pip" install --no-input \
        "$srcdir/$_wheel"
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
    ln -s "$_appdir/venv/bin/nanobot-desktop-tui" "$pkgdir/usr/bin/nanobot-desktop-tui"

    # License and third-party notices from the wheel
    python - <<EOF
import pathlib, zipfile
z = zipfile.ZipFile("$srcdir/$_wheel")
out = pathlib.Path("$pkgdir/usr/share/licenses/$pkgname")
out.mkdir(parents=True, exist_ok=True)
(out / "LICENSE").write_bytes(z.read("nanobot_ai-${pkgver}.dist-info/licenses/LICENSE"))
(out / "THIRD_PARTY_NOTICES.md").write_bytes(
    z.read("nanobot_ai-${pkgver}.dist-info/licenses/THIRD_PARTY_NOTICES.md"))
EOF
}
