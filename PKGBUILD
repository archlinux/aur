# Maintainer: Marcus Behrendt <marcus dot behrendt dot 86 et bigbrothergoogle>

pkgname=pupil-eye-tracking-bin
_major=1.22
_minor=3
pkgver="${_major}.${_minor}"
pkgrel=1
pkgdesc="Open source eye tracking software platform that started as a thesis project at MIT"
arch=('x86_64')
license=("LGPL v3.0")
url="https://github.com/pupil-labs/pupil"

_version="v${_major}-${_minor}-gac28eeb"
_source="pupil_${_version}_linux_x64"

source=("https://github.com/pupil-labs/pupil/releases/download/v${pkgver}/${_source}.zip")
sha256sums=('79329a8998a5fb997f0f7c4b64cdf3d9ea366fec0ffa96b3db22ef2c0e2e4bfd')
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
