# Maintainer: GreyXor <greyxor@protonmail.com>

pkgname='polarproxy-bin'
pkgver=0.9.10
pkgrel=1
pkgdesc='Transparent TLS and SSL inspection proxy primarily designed for incident responders and malware researchers to intercept, decrypt, and re-encrypt TLS encrypted traffic from malware while saving it in a PCAP file.'
arch=('x86_64')
url='https://www.netresec.com/?page=PolarProxy'
license=('GPL2')
depends=('glibc' 'gcc-libs' 'zlib' 'lttng-ust2.12')
source=("$pkgname.tar.gz::https://www.netresec.com/?download=PolarProxy"
"polarproxy_icon.png"
"polarproxy.desktop"
)
b2sums=('2d8df8af9cb986e454e417638af05ffdb19840ac1ed0420fdb161afb3f10c124134b95b2045a65d202d040ab02f0ed11b17e176c0435ec95f90385eaf1994ef3'
        'd16df3c5469813bd5600bc8d56302c31e2e45ff0b6be582a3b12b28c9cfe64ac687aff8c4fdf49f6d09081b09242dd5df9ca1e88b345ccabf08f744094f5a4ea'
        'e805d3513b453b5f7be9e02c06426956bcf63928bdb983efafff6c62a5801a37039428c87665f8c63db84df0d3e837773b5d646695f39d79959f9e2821afca92')

pkgver() {
	# Calculate the version from filename
	echo $(curl -sI https://www.netresec.com/\?download\=PolarProxy | grep -o -E 'filename=.*$' | sed -e 's/filename=//' | grep -oP '\d+-\d+-\d+' | sed 's/-/./g')
}

package() {
	install -d "${pkgdir}/opt/${pkgname%-bin}"
	install -d "${pkgdir}/usr/share/applications"
	install -d "${pkgdir}/usr/share/icons"
  install -d "${pkgdir}/etc/systemd/system/"
  install -dm755 "${pkgdir}"/usr/bin/

	install -m644 "polarproxy_icon.png" "${pkgdir}/usr/share/icons/${pkgname%-bin}.png"
	install -m644 "polarproxy.desktop" "${pkgdir}/usr/share/applications"
  ln -s /opt/${pkgname%-bin}/PolarProxy "${pkgdir}"/usr/bin/polarproxy


	install -m644 "${srcdir}/PolarProxy.service" "${pkgdir}/etc/systemd/system/"
  cp -r "${srcdir}/"* "${pkgdir}/opt/${pkgname%-bin}"
  chmod +x "${pkgdir}/opt/${pkgname%-bin}"/PolarProxy

  rm -rf "${pkgdir}/opt/${pkgname%-bin}"/polarproxy-bin.tar.gz
  rm -rf "${pkgdir}/opt/${pkgname%-bin}"/polarproxy.desktop
  rm -rf "${pkgdir}/opt/${pkgname%-bin}"/polarproxy_icon.png
}
