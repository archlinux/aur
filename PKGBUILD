# Maintainer: Dorian Rudolph <mail@dorianrudolph.com
_pkgname=wayland-debug-cli
pkgname=$_pkgname-git
pkgver=r397.a9dde8a
pkgrel=1
pkgdesc="A CLI for viewing, filtering, and setting breakpoints on Wayland protocol messages."
arch=('x86_64')
url="https://github.com/wmww/wayland-debug"
license=('MIT')
groups=()
depends=('glibc' 'libffi' 'expat' 'libxml2' 'python' 'gdb' 'wayland')
makedepends=('git' 'meson' 'ninja' 'libxslt' 'doxygen' 'xmlto' 'graphviz' 'docbook-xsl')
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=("etc/$_pkgname/$_pkgname.conf")
source=("$_pkgname::git+https://github.com/wmww/wayland-debug")
md5sums=('SKIP')
options=(!strip)

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"

    cd resources
    git clone https://gitlab.freedesktop.org/wayland/wayland.git
    cd wayland
    git checkout "$(pacman -Q wayland | grep -Po '\d+\.\d+\.\d+')"
    meson --buildtype=debug build
    ninja -C build
}

package() {
    cd "$srcdir/$_pkgname"

    name=wayland-debug
    libdir="$pkgdir/usr/lib/$name"
    mkdir -p "$pkgdir/usr/bin"

    find . -type l,f ! -path "./.git*" \( -name 'libwayland-client.so' -or -name 'libwayland-server.so' -or ! -path "./resources/wayland/*" \) ! -path "*/libwayland_debug_logs/*" ! -name "update-protocols.sh" -exec install -Dm644 {} "$libdir/{}" \;
    chmod +x "$libdir/main.py"
    ln -s "/usr/lib/$name/main.py" "$pkgdir/usr/bin/$name"

    while read -rd '' _file; do
        _destdir="$(dirname "${_file#${pkgdir}}")"
        python3 -m compileall -d "${_destdir}" "${_file}"
        python3 -O -m compileall -d "${_destdir}" "${_file}"
    done < <(find "$libdir" -name '*.py' -print0)
}
