# Maintainer: Adrian Baumgart <adrian at abmgrt dot dev>

pkgname=keyguard
pkgver=20240814
pkgrel=1
pkgdesc="Alternative client for the Bitwarden platform, created to provide the best user experience possible."
arch=('x86_64')
url='https://github.com/AChep/keyguard-app.git'
license=('custom')
depends=()
makedepends=('jdk17-openjdk' 'dpkg')
source=("https://github.com/AChep/keyguard-app/archive/refs/tags/r${pkgver}.tar.gz")
sha256sums=('71def31dd0a0b78465a2205d296e42782a7db79b9b87101694d0b15291dddb1b')
options=('!strip' '!debug')


build() {
    _codesource="${srcdir}/${pkgname}-app-r${pkgver}"
    cd "${_codesource}"

    # create gradle.properties

    echo -e "\nbuildkonfig.flavor=release" >> "${_codesource}/gradle.properties"    
    # build .deb file
    ./gradlew :desktopApp:packageDeb
}

package() {
    _codesource="${srcdir}/${pkgname}-app-r${pkgver}"

    # extract data from built .deb file
    mkdir -p "${srcdir}/deb"
    cd "${srcdir}/deb"
    ar vx "${_codesource}/desktopApp/build/compose/binaries/main/deb/$(ls ${_codesource}/desktopApp/build/compose/binaries/main/deb)"
    
    # extract data.tar.xz from .deb file
    mkdir -p "${srcdir}/output"
    tar -xvf "${srcdir}/deb/data.tar.xz" -C "${srcdir}/output"

    # copy and install contents of data.tar.xz
    cp -r "${srcdir}/output/"* "${pkgdir}"
    install -d "${pkgdir}"/opt/keyguard

    # create link to /usr/bin
    mkdir -p "${pkgdir}"/usr/bin
    ln -s "${pkgdir}/opt/keyguard/bin/Keyguard" "${pkgdir}/usr/bin/keyguard"
    install -d "${pkgdir}"/usr/bin

    # create .desktop file and install
    cat > "${srcdir}/keyguard.desktop" << EOL
    [Desktop Entry]
    Type=Application
    Name=Keyguard
    Comment=Alternative client for the Bitwarden platform
    Path=/opt/keyguard/bin
    Exec=/opt/keyguard/bin/Keyguard
    Icon=keyguard
    Terminal=false
    Cateogories=Utility

EOL

    mkdir -p "${pkgdir}/usr/share/pixmaps"
    mkdir -p "${pkgdir}/usr/share/applications"
    install -Dm0644 "${_codesource}/desktopApp/icon.png" "${pkgdir}/usr/share/pixmaps/keyguard.png"
    install -Dm0644 "${srcdir}/keyguard.desktop" "${pkgdir}/usr/share/applications/"
} 
