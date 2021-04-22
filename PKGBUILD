# Maintainer: Leonidas Spyropoulos <artafinde at gmail dot com>

### BUILD OPTIONS
# Set these variables to ANYTHING that is not null to enable them

# Optional select if you would like to use NO-JBR. You can override the JJDK used from Idea with
# a file `idea.sh` at `~/.config/JetBrains/IntelliJIdea${_veryear}.${_verrelease}/
# Note - available options:
# 1. <empty> JBR 11 (default)
# 2. no-jbr No bundled JBR included (make sure you provide a Java runtime)
_JBR=

### Do no edit below this line unless you know what you're doing

pkgname=intellij-idea-ue-eap
_pkgname=idea-IU
_buildver=211.7142.13
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
if [ -n "${_JBR}" ]; then
    source=("https://download.jetbrains.com/idea/ideaIU-${_buildver}-${_JBR}.tar.gz")
    sha256sums=($(curl -s "${source}.sha256" | cut -f1 -d" "))
else
    source=("https://download.jetbrains.com/idea/ideaIU-${_buildver}.tar.gz")
    sha256sums=($(curl -s "${source}.sha256" | cut -f1 -d" "))
fi

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
    ln -s "/opt/${pkgname}/bin/idea.sh" "${pkgdir}/usr/bin/idea-ue-eap"
}

# vim:set ts=4 sw=4 et:
