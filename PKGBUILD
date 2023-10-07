# Maintainer: 0xGingi <0xgingi@0xgingi.com>
pkgname=('spacebar-client-git')
pkgver=r415.79345f7
pkgrel=1
pkgdesc="Open source, themeable and extendable discord-compatible native Spacebar client"
arch=('any')
url="https://github.com/spacebarchat/client"
license=('AGPL3')
makedepends=('git' 'nodejs' 'npm')
provides=('spacebar-client')
conflicts=('spacebar-client')
source=("git+https://github.com/spacebarchat/client.git" "git+https://github.com/0xGingi/spacebarchat-client-aur.git")
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd client
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd spacebarchat-client-aur
	sed -i "s|^User=.*\$|User=$USER|" spacebar-client.service 
}


build() {
    cd client
    npm install
    npm run build linux
}

package() {
    cd client
    install -d ${pkgdir}/opt/spacebar-client
    cp -r build/* ${pkgdir}/opt/spacebar-client
    npm install -g serve
    cd ${srcdir}/spacebarchat-client-aur
    install -Dm0644 "spacebar-client.service" "${pkgdir}/etc/systemd/system/spacebar-client.service"

	echo
	echo
	echo -------------------------------------------------------------
	echo 'Spacebar-Client is now installed!'
	echo 'Install location - /opt/spacebar-client'
	echo 'Systemd Service - /etc/systemd/system/spacebar-client.service'
	echo
	echo 'Start the client with sudo systemctl start spacebar-client'
	echo 'Spacebar-Client will start at http://localhost:3000'
	echo -------------------------------------------------------------
	echo
	echo
}
