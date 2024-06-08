# Maintainer: Akarshan Biswas <akarshan.biswas@gmail.com>
pkgname=xpu-smi-bin
pkgver=1.2.35
pkgrel=1
pkgdesc="Intel(R) XPU System Management Interface is a free and open-source tool for managing Intel data center GPUs."
arch=('x86_64')
url="https://github.com/intel/xpumanager"
source=("https://github.com/intel/xpumanager/releases/download/V${pkgver}/xpu-smi_${pkgver}_20240423.025307.efa70d34+deb10u1_amd64.deb")
license=('MIT')
depends=('igsc>=0.8.4' 'level-zero-loader>=1.3.23726')
optdepends=('intel-media-driver>=22.5.0'
            'intel-media-sdk>=22.5.0'
            'intel-metrics-discovery>=1.10.141'
            'intel-metrics-library>=1.0.76'
            'libmfxgen1>=22.5.0')
options=('!strip' '!emptydirs')
sha512sums=('16fa9eb84483ee4bf4a7d67d195684dba7d618ab12807a0fccfc4c5d7ad0d523c0eaa1ffa5dd0f57e4a6a6d5f650fe2a23cec52fce64eb497794f6f8e7dcff2b')

prepare() {
	mkdir -p $pkgname-$pkgver
	bsdtar -xf "xpu-smi_${pkgver}_20240423.025307.efa70d34+deb10u1_amd64.deb" -C "$pkgname-$pkgver"
	
}

package() {

	# Extract package data
	tar -xz -f data.tar.gz -C "${pkgdir}"
	
	# patch up to move the libraries into an upper directory so that bin can find it	
	find "${pkgdir}/usr/lib/x86_64-linux-gnu" \( -type f -o -type l \) -exec mv -v {} "${pkgdir}/usr/lib/" \;
	
	# This directory is empty now, so remove it
	rmdir "${pkgdir}/usr/lib/x86_64-linux-gnu"

	install -D -m644 "${pkgdir}/usr/lib/xpu-smi/resources/mediadata/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
