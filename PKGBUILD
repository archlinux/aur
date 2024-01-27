# Maintainer: Chris Zhang <develop@zcy.moe>

# basic info
_pkgname="heptabase"
_pkgname_capital="Heptabase"
pkgname="$_pkgname-bin"
_pkgext="AppImage"
pkgver="1.23.1"
pkgrel=1
pkgdesc="A visual note-taking tool for learning complex topics."
url="https://heptabase.com"
arch=('x86_64')
license=('custom')
source=(
    "https://github.com/heptameta/project-meta/releases/download/v$pkgver/$_pkgname_capital-$pkgver.$_pkgext"
)
sha512sums=(
    "f552c608361c3ef2c0bb5e7b2884fcb73f052e5d733d0c42eaf1632cceb34751a2626ba102ca07212ed8d70dd08f1562076067ed5f97cdb799760bc4fa8aaccd"
)

prepare() {
    _gen_script
    if [[ "${_pkgext::1}" == "A" ]] ; then
        chmod +x "$_pkgname_capital-$pkgver.$_pkgext"
        "./$_pkgname_capital-$pkgver.$_pkgext" --appimage-extract
        ln -sf "squashfs-root" "$_pkgname"
    fi
}

_gen_script() {
  cat <<'EOF' > "$_pkgname.sh"
#!/usr/bin/env sh
set -e

APPDIR="/opt/heptabase"
_ELECTRON="${APPDIR}/project-meta"

_FLAGS_FILE="${XDG_CONFIG_HOME:-$HOME/.config}/heptabase-flags.conf"
if [ -r "$_FLAGS_FILE" ]; then
  _USER_FLAGS="$(cat "$_FLAGS_FILE")"
fi

if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec ${_ELECTRON} $_USER_FLAGS "$@"
else
    exec ${_ELECTRON} --no-sandbox $_USER_FLAGS "$@"
fi
EOF
}

package() {
    sed s#AppRun#heptabase# $_pkgname/project-meta.desktop -i

    install -Dm644 "$_pkgname/project-meta.desktop" "$pkgdir/usr/share/applications/project-meta.desktop"
    install -Dm644 "$_pkgname/project-meta.png" "$pkgdir/usr/share/pixmaps/project-meta.png"
    install -Dm755 "$_pkgname.sh" "$pkgdir/usr/bin/heptabase"

    rm -- "$_pkgname.sh"

    install -dm755 "$pkgdir/opt/$_pkgname"
    cp --reflink=auto -r "$srcdir/$_pkgname"/* "$pkgdir/opt/$_pkgname/"

    chmod -R u=rwX,go=rX "$pkgdir"
}
