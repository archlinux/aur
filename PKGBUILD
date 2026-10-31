# Maintainer: Thomas Flori <thflori@gmail.com>
pkgname=vte-console-git
pkgver=1.0.0rc1.r0.g9454abc
pkgrel=1
pkgdesc="Wayland-native dropdown terminal (GTK4 + VTE + gtk4-layer-shell)"
arch=(any)
url="https://gitlab.w00tserver.org/tflori/vte-console"
license=(MIT)
depends=(gtk4 vte4 gtk4-layer-shell python-gobject)
makedepends=(git)
provides=(vte-console)
conflicts=(vte-console)

source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    local _tag
    _tag=$(git describe --long --tags 2>/dev/null)
    if [[ -n "$_tag" ]]; then
        # v1.0.0-rc.1-5-gabc -> 1.0.0rc1.r5.gabc: pre-releases without a dot,
        # otherwise pacman sorts 1.0.0.rc.1 after 1.0.0
        echo "$_tag" | sed 's/^v//;s/-\(alpha\|beta\|rc\)\.\?\([0-9]*\)/\1\2/;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    fi
}

package() {
    local _src="${srcdir}/${pkgname}"
    local _lib="${pkgdir}/usr/lib/vte-console"

    # Python modules + CSS
    install -dm755 "${_lib}"
    install -m644 "${_src}"/*.py "${_lib}/"
    install -m644 "${_src}/style.css" "${_lib}/"
    git -C "${_src}" describe --tags > "${_lib}/VERSION"

    # License
    install -Dm644 "${_src}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Example config
    install -Dm644 "${_src}/example.config.ini" \
        "${pkgdir}/usr/share/vte-console/example.config.ini"

    # Launcher wrapper
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/vte-console" << 'WRAPPER'
#!/bin/sh
exec python3 /usr/lib/vte-console/vte-console.py "$@"
WRAPPER

    # Desktop files — fix hardcoded path
    install -dm755 "${pkgdir}/usr/share/applications"
    local _desktop
    for _desktop in de.thflori.vte-console.desktop de.thflori.vte-console-tab.desktop; do
        sed 's|python3 /path/to/vte-console/vte-console.py|/usr/bin/vte-console|g' \
            "${_src}/${_desktop}" \
            > "${pkgdir}/usr/share/applications/${_desktop}"
    done

    # Man page
    install -Dm644 "${_src}/man/vte-console.1" \
        "${pkgdir}/usr/share/man/man1/vte-console.1"
}
