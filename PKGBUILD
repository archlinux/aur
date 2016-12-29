# Author: Kyle Manna <kyle at kylemanna dot com>

pkgname=do-agent
pkgver=0.4.6
pkgrel=2
pkgdesc='DigitalOcean Agent for Enhanced Droplet Graphs'
url='https://agent.digitalocean.com/install.sh'
arch=('x86_64')

# License in Debian pkg metadata is "Unknown"
license=('unknown')

source=("https://repos.sonar.digitalocean.com/apt/pool/main/d/${pkgname}/${pkgname}_${pkgver}_amd64.deb"
        "do-agent.service")

sha256sums=('a720363eed91b41ae465ee35e0658e9debbc3ecc7f9ded8746d5c046828cc638'
            'dfa9c58a18985bedb2e971b68e015b52baaf08079358f23a7128a791843d4e53')

package() {
    cd "$srcdir"
    bsdtar --to-stdout -xf "${pkgname}_${pkgver}_amd64.deb" data.tar.gz | bsdtar -xf - -C "${pkgdir}"

    # /lib is a symlink on Arch
    mv "${pkgdir}/lib" "${pkgdir}/usr/"

    # Copy working systemd service over top
    cp do-agent.service "${pkgdir}/usr/lib/systemd/system/do-agent.service"

    # Ain't nobody got time for old init systems
    rm "${pkgdir}/etc/init/do-agent.conf"
}
