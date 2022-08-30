# Maintainer: Maksim Terpilowski <maximtrp at google mail com>

pkgname=pupil-eye-tracking-bin

_major=3
_minor=5
_patch=8
_commit=0c019f6

pkgver="${_major}.${_minor}.${_patch}"
pkgrel=1
pkgdesc="Open source eye tracking software platform that started as a thesis project at MIT"
arch=('x86_64')
license=("LGPL v3.0")
url="https://github.com/pupil-labs/pupil"

_major_minor="v${_major}.${_minor}"
_version="${_major_minor}-${_patch}-g${_commit}"
_source="pupil_${_version}_linux_x64"

source=("https://github.com/pupil-labs/pupil/releases/download/${_major_minor}/${_source}.zip")
sha256sums=('786feb5e937a68a21821ab6b6d86be915bcbb7c5e24c11664dbf8a95e5fcb8cc')
options=('!strip')

package() {
    extract_deb "player"
    extract_deb "capture"
    extract_deb "service"

    cd "${srcdir}/${_source}"

    mkdir -p "${pkgdir}/opt/pupil"

    for app in player capture service; do
        cp -nrl ${app}/opt/pupil_${app}/* "${pkgdir}/opt/pupil"
        cp -nrl ${app}/usr "${pkgdir}"

        echo "#!/bin/sh
exec /opt/pupil/pupil_${app} \"\$@\"" > "${pkgdir}/usr/bin/pupil_${app}"

        sed -i "s|/opt/pupil_${app}/||" "${pkgdir}/usr/share/applications/pupil_${app}.desktop"
    done
}

extract_deb() {
    cd "${srcdir}/${_source}"

    mkdir $1
    cd $1

    ar x "../pupil_$1_linux_os_x64_${_version}.deb"
    tar xf data.tar.xz -C ../$1
}
