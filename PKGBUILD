# Maintainer: Alessio <alessio@linux.com> 
pkgname=pritunl-client-electron-git
pkgver=1.3.3600.11.r2.g716164a1
pkgrel=1
pkgdesc="Pritunl Electron Client (Git version)"
arch=('x86_64')
url="https://github.com/pritunl/pritunl-client-electron"
_reponame=pritunl-client-electron-git
license=('AGPL3')

conflicts=('pritunl-client-bin')
depends=('electron' 'nodejs' 'npm' 'gettext')
makedepends=('electron' 'nodejs' 'npm' 'gettext')



source=("git+https://github.com/pritunl/pritunl-client-electron.git")


pkgver() {
  cd "$srcdir/pritunl-client-electron"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p ~/.local/bin
  npm config set prefix '~/.local/'

}

build() {
    cd "${srcdir}/pritunl-client-electron"

    cd service
    go get -u
    go install

    cd ../cli
    go get -u
    go install

    cd ../client
    npm install
    ./node_modules/.bin/electron-packager ./ Pritunl --platform=linux --arch=x64 --out=../build/linux
}

package() {
    cd ${srcdir}/pritunl-client-electron/
    mkdir -p ${pkgdir}/usr/share/applications
    cp resources_linux/pritunl-client-electron.desktop ${pkgdir}/usr/share/applications/pritunl-client-electron.desktop

    mkdir -p ${pkgdir}/etc/systemd/system
    cp resources_linux/pritunl-client.service ${pkgdir}/etc/systemd/system/pritunl-client.service

    mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/usr/lib
    mv build/linux/Pritunl-linux-x64 ${pkgdir}/usr/lib/pritunl_client_electron
    chmod 755 ${pkgdir}/usr/lib/pritunl_client_electron
    chmod 4755 ${pkgdir}/usr/lib/pritunl_client_electron/chrome-sandbox
    ln -s /usr/lib/pritunl_client_electron/Pritunl ${pkgdir}/usr/bin/pritunl-client-electron

    cp ~/go/bin/service ${pkgdir}/usr/bin/pritunl-client-service
    cp ~/go/bin/cli ${pkgdir}/usr/bin/pritunl-client

    mkdir -p ${pkgdir}/usr/share/icons
    mv resources_linux/icons ${pkgdir}/usr/share/icons/hicolor
    find ${pkgdir}/usr/share/icons -type d -exec chmod 755 {} \;
    find ${pkgdir}/usr/share/icons -type f -exec chmod 644 {} \;

    mkdir -p ${pkgdir}/var/log
    touch ${pkgdir}/var/log/pritunl-client.log
    touch ${pkgdir}/var/log/pritunl-client.log.1
}

post_install() {
    chmod 755 /usr/lib/pritunl_client_electron || true
    systemctl stop pritunl-client-electron &> /dev/null || true
    systemctl disable pritunl-client-electron &> /dev/null || true
    systemctl daemon-reload &> /dev/null || true
    systemctl start pritunl-client &> /dev/null || true
    systemctl enable pritunl-client &> /dev/null || true
    gtk-update-icon-cache -q -t -f /usr/share/icons/hicolor || true
    xdg-icon-resource forceupdate --theme hicolor &> /dev/null || true
    update-desktop-database -q || true
}

sha256sums=(SKIP)
validpgpkeys=()
