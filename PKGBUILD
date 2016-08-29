# Maintainer: Amr Hassan <amr.hassan at gmail dot com>

pkgname=intellij-idea-ce
_pkgname=idea-IC
_buildver=162.1628.40
_veryear=2016
_verrelease=2
_extraver=2
_nojdkrelease=true
pkgver=${_veryear}.${_verrelease}.${_extraver}
pkgrel=1
pkgdesc="Intellij Idea IDE (community version) with Intellij JDK"
arch=('any')
options=(!strip)
url="http://www.jetbrains.com/idea/"
license=('Apache2')
depends=('java-environment' 'giflib' 'libxtst')
makedepends=('wget')
source=("https://download.jetbrains.com/idea/ideaIC-${pkgver}.tar.gz")
sha256sums=($(wget -q "${source}.sha256" && cat "ideaIC-${pkgver}.tar.gz.sha256" | cut -f1 -d" "))

package() {
    cd "$srcdir"
    mkdir -p "${pkgdir}/opt/${pkgname}"
    cp -R "${srcdir}/idea-IC-$_buildver/"* "${pkgdir}/opt/${pkgname}"
    if [[ $CARCH = 'i686' ]]; then
        rm -f "${pkgdir}/opt/${pkgname}/bin/libyjpagent-linux64.so"
        rm -f "${pkgdir}/opt/${pkgname}/bin/fsnotifier64"
    fi
    if [ "${_nojdkrelease}" = "false" ] && [ -n "${_remove_bundled_jre}" ]; then
      msg "Removing bundled JRE..."
      rm -rf "${pkgdir}/opt/${pkgname}/jre"
    fi
(
cat <<EOF
[Desktop Entry]
Version=$pkgver
Type=Application
Name=IntelliJ IDEA Community EAP
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
    for i in $(ls $srcdir/idea-IC-$_buildver/license/ ); do
      ln -sf "${srcdir}/idea-IC-$_buildver/license/$i" "${pkgdir}/usr/share/licenses/${pkgname}/$i"
    done
    ln -s "${pkgdir}/opt/${pkgname}/bin/idea.sh" "${pkgdir}/usr/bin/idea-ce-eap"
}

# vim:set ts=2 sw=2 et:
