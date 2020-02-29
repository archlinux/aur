# Maintainer: Marcus Behrendt <marcus dot behrendt dot 86 et bigbrothergoogle>

pkgname=pupil-eye-tracking-bin

_major=1
_minor=22
_patch=7
_commit=bcfbf7d

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
sha256sums=('945ed6a758056d09ad4292a57c5686c9975e278ee80ec320bdf6bfe1c243c2e5')
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
