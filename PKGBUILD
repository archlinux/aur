# Maintainer: GreyXor <greyxor@protonmail.com>

pkgname='polarproxy-bin'
pkgver=2.0.1
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
b2sums=('2035d46e9f185c525512ed638a7cea01d006a17a01fa802542010a8f5229151d633b52125add25fb49b4b93b027c9d4f63a100ee34eae385a9e561b76f8bb506'
        'd16df3c5469813bd5600bc8d56302c31e2e45ff0b6be582a3b12b28c9cfe64ac687aff8c4fdf49f6d09081b09242dd5df9ca1e88b345ccabf08f744094f5a4ea'
        'e805d3513b453b5f7be9e02c06426956bcf63928bdb983efafff6c62a5801a37039428c87665f8c63db84df0d3e837773b5d646695f39d79959f9e2821afca92')
options=('!strip')

pkgver() {
	# Calculate the version from filename
	echo $(curl -sI "https://www.netresec.com/?download=PolarProxy" | grep -oP 'PolarProxy_\K[0-9]+\.[0-9]+\.[0-9]+')
}

package() {
    local pkgname_no_bin="${pkgname%-bin}"

    # Create directories
    install -d "${pkgdir}/opt/${pkgname_no_bin}"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
    install -d "${pkgdir}/etc/systemd/system"

    # Copy PolarProxy binary
    cp -p "${srcdir}/PolarProxy" "${pkgdir}/opt/${pkgname_no_bin}/"
    chmod +x "${pkgdir}/opt/${pkgname_no_bin}/PolarProxy"

    # Symlink to /usr/bin
    ln -s "/opt/${pkgname_no_bin}/PolarProxy" "${pkgdir}/usr/bin/polarproxy"

    # Copy icons and desktop entry
    install -Dm644 "${srcdir}/polarproxy_icon.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname_no_bin}.png"
    install -Dm644 "${srcdir}/polarproxy.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname_no_bin}.desktop"

    # Copy systemd service
    install -Dm644 "${srcdir}/polarproxy.service" \
        "${pkgdir}/etc/systemd/system/polarproxy.service"

    # Copy remaining supporting files (optional)
    cp -r "${srcdir}/ruleset-"* "${pkgdir}/opt/${pkgname_no_bin}/"

    # Remove unnecessary files
    rm -f "${pkgdir}/opt/${pkgname_no_bin}"/polarproxy-bin.tar.gz
    rm -f "${pkgdir}/opt/${pkgname_no_bin}"/polarproxy.desktop
    rm -f "${pkgdir}/opt/${pkgname_no_bin}"/polarproxy_icon.png
}
