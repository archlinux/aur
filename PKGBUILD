# Maintainer: Leonidas Spyropoulos <artafinde at gmail dot com>

pkgname=intellij-idea-ue-eap
_pkgname=idea-IU
_buildver=211.5787.15
_veryear=2021
_verrelease=1
_verextra=
pkgver=${_veryear}.${_verrelease}.${_buildver}
pkgrel=2
pkgdesc="Early access version of the upcoming version of Intellij Idea IDE (ultimate version)"
arch=('any')
options=(!strip)
url="http://www.jetbrains.com/idea/nextversion"
license=('custom')
depends=('java-environment' 'giflib' 'libxtst' 'libdbusmenu-glib')
source=("https://download.jetbrains.com/idea/ideaIU-${_buildver}.tar.gz"
        'idea-ue-eap.sh')
sha256sums=($(curl -sO "${source}.sha256" && cat "ideaIU-${_buildver}.tar.gz.sha256" | cut -f1 -d" ")
            '2094f03ada492990dcfe0ac08f6001d55a11b441bcb9dfca92124ff68e129dcd')

prepare() {
    cd "${srcdir}/${_pkgname}-${_buildver}"
    # Remove bin/libs of non-matching architectures
    if [[ $CARCH = 'i686' ]]; then
        rm bin/libyjpagent-linux64.so
        rm bin/fsnotifier64
        rm bin/idea64.vmoptions
        rm -rf lib/pty4j-native/linux/x86_64
    fi
    if [[ $CARCH = 'x86_64' ]]; then
        rm bin/fsnotifier
        rm bin/idea.vmoptions
        rm -rf lib/pty4j-native/linux/x86
   fi
}

package() {
    cd "$srcdir"
    mkdir -p "${pkgdir}/opt/${pkgname}"
    cp -R "${srcdir}/${_pkgname}-${_buildver}/"* "${pkgdir}/opt/${pkgname}"
(
cat <<EOF
[Desktop Entry]
Version=$pkgver
Type=Application
Name=IntelliJ IDEA Ultimate EAP
Comment=Intelligent Java IDE - EAP version
Exec="/opt/$pkgname/bin/idea.sh" %f
Icon=/opt/$pkgname/bin/idea.png
Comment=$pkgdesc
Categories=Development;IDE;
Terminal=false
StartupNotify=true
StartupWMClass=jetbrains-idea
EOF
) > "${srcdir}/${pkgname}.desktop"

    mkdir -p "${pkgdir}/usr/bin/"
    mkdir -p "${pkgdir}/usr/share/applications/"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
    for i in $(ls $srcdir/${_pkgname}-$_buildver/license/ ); do
      ln -sf "${srcdir}/${_pkgname}-${_buildver}/license/$i" "${pkgdir}/usr/share/licenses/${pkgname}/$i"
    done
    install -Dm 755 "idea-ue-eap.sh" "${pkgdir}/usr/bin/idea-ue-eap"
}

# vim:set ts=4 sw=4 et:
