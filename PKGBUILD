# Maintainer: Leonidas Spyropoulos <artafinde at gmail dot com>
# Based on Pycharm-EAP PKGBUILD by lots0logs

### BUILD OPTIONS
# Set these variables to ANYTHING that is not null to enable them

# Remove bundled JRE - make sure you use your own, either through JAVA_HOME or
# by setting the path to the JDK in ~/.IntelliJIdea16/config/idea.jdk
_remove_bundled_jre=

### Do no edit below this line unless you know what you're doing

pkgname=intellij-idea-ce-eap
_pkgname=idea-IC
_buildver=145.184.1
_pkgver=16
_eap="True"
epoch=3
pkgver=16.${_buildver}
pkgrel=1
pkgdesc="Early access version of the upcoming version of Intellij Idea IDE (community version)"
arch=('any')
options=(!strip)
url="http://www.jetbrains.com/idea/"
license=('Apache2')
depends=('java-environment' 'giflib' 'libxtst')
makedepends=('wget')
if [[ ${_eap} = "True" ]]; then
	source=("http://download.jetbrains.com/idea/ideaIC-${_buildver}.tar.gz")
  sha256sums=($(wget -q "${source}.sha256" && cat "ideaIC-${_buildver}.tar.gz.sha256" | cut -f1 -d" "))
else
	source=("http://download.jetbrains.com/idea/ideaIC-${_pkgver}-Preview.tar.gz")
  sha256sums=($(wget -q "${source}.sha256" && cat "ideaIC-${_pkgver}-Preview.tar.gz.sha256" | cut -f1 -d" "))
fi

package() {
    cd "$srcdir"
    mkdir -p "${pkgdir}/opt/${pkgname}"
    if [ -n "$_remove_bundled_jre" ]; then
		    msg "Removing bundled JRE..."
        rm -rf "${srcdir}/idea-IC-${_buildver}/jre"
	  fi
    cp -R "${srcdir}/idea-IC-${_buildver}/"* "${pkgdir}/opt/${pkgname}"
    if [[ $CARCH = 'i686' ]]; then
        rm -f "${pkgdir}/opt/${pkgname}/bin/libyjpagent-linux64.so"
        rm -f "${pkgdir}/opt/${pkgname}/bin/fsnotifier64"
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
    ln -s "/opt/${pkgname}/bin/idea.sh" "${pkgdir}/usr/bin/idea-ce-eap"
}

# vim:set ts=2 sw=2 et:
