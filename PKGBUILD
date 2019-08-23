# Maintainer: Miguel Revilla <yo at miguelrevilla dot com>

pkgname=autofirmaja
pkgver=1.6.0
pkgrel=1
pkgdesc='Junta de Andalucia digital signature client'
arch=('i686' 'x86_64')
url='https://ws024.juntadeandalucia.es/clienteafirma/autofirma/autofirma.html'
license=('GPL' 'EUPL')
depends=('java-runtime=8' 'nss' 'firefox')
makedepends=('binutils' 'openssl')
source=('https://ws024.juntadeandalucia.es/clienteafirma/autofirma/AutoFirma_v1_6_0_JAv01.deb')
md5sums=('ff2211f3035f72615024a8a2e4561069')
sha512sums=('4e520afa9abc4bc48eb6ffb9e7a30700d84a58d7aa11d708b349126cb8dbcce9e151acd08fbabdf9d35d1e9d38c5c44baed5cc04339c3faa8a340b8482e909c0')

prepare() {
	tar -xf data.tar.xz
}

package() {

	mkdir -p "${pkgdir}"/usr/lib/firefox/defaults/pref/
	mv etc/firefox/pref/AutoFirmaJA.js etc/firefox/pref/AutoFirmaJA.js.tmp
	tail -4 etc/firefox/pref/AutoFirmaJA.js.tmp > etc/firefox/pref/AutoFirmaJA.js
	cp -d --no-preserve=ownership etc/firefox/pref/AutoFirmaJA.js "${pkgdir}"/usr/lib/firefox/defaults/pref/
	cp -dr --no-preserve=ownership usr "${pkgdir}"/

	mkdir -p "${pkgdir}"/usr/share/licenses/autofirmaja/
	ln -s /usr/share/doc/AutoFirmaJA/copyright "${pkgdir}"/usr/share/licenses/autofirmaja/LICENSE
	rm "${pkgdir}"/usr/bin/AutoFirmaJA-FirefoxChrome

	sed -i 's|dir = /usr/share/AutoFirmaJA/|dir = usr/share/AutoFirmaJA/|' usr/share/AutoFirmaJA/openssl.cnf

	# Create random password
	openssl rand -base64 48 > randomkey.txt

	# CREATE CERTIFICATION AUTHORITY "AutoFirmaJA ROOT LOCAL"
	# Create CA key
	openssl genrsa -aes128 -passout file:randomkey.txt -out AutoFirmaJA.key 2048
	# Create request for signature
	openssl req -config usr/share/AutoFirmaJA/openssl.cnf -new -passin file:randomkey.txt -key AutoFirmaJA.key -out AutoFirmaJA.csr  -subj "/CN=AutoFirmaJA ROOT LOCAL"
	# Self sign the request
	openssl x509 -req -days 3650 -in AutoFirmaJA.csr -signkey AutoFirmaJA.key -passin file:randomkey.txt  -out AutoFirmaJA.crt -extensions exts -extfile usr/share/AutoFirmaJA/extensions.txt

	# CREATE A CERTIFICATE FOR COMMUNICATION BETWEEN BROWSER AND SIGNATURE CLIENTE
	# Another random password
	openssl genrsa -aes128 -passout file:randomkey.txt -out localhost.key 2048
	# Another request for signature
	openssl req -new -passin file:randomkey.txt -key localhost.key -out localhost.csr  -subj "/CN=127.0.0.1"
	# Sign the request with our CA signature
	openssl ca -batch -config usr/share/AutoFirmaJA/openssl.cnf -policy signing_policy -extensions signing_req -cert AutoFirmaJA.crt -keyfile AutoFirmaJA.key -passin file:randomkey.txt -in localhost.csr -out localhost.crt

	# Export key and certificate to pfx
	openssl pkcs12 -export -out autofirmaJA.pfx -passout pass:654321 -inkey localhost.key -passin file:randomkey.txt  -in localhost.crt  -name "socketautofirmalocal" -certfile AutoFirmaJA.crt
	chmod ugo+r autofirmaJA.pfx
	
	# Some cleaning
	rm randomkey.txt AutoFirmaJA.key AutoFirmaJA.csr localhost.key localhost.csr localhost.crt

	# Move CA certificate where it will be found by browsers
	mkdir -p "${pkgdir}"/usr/share/ca-certificates/trust-source/anchors
	mv AutoFirmaJA.crt "${pkgdir}"/usr/share/ca-certificates/trust-source/anchors/

	# Move pfx where the application needs it
	mv autofirmaJA.pfx "${pkgdir}"/usr/lib/AutoFirmaJA/

	# Final cleaning
	rm "${pkgdir}"/usr/share/applications/afirmaja-firefoxchrome.desktop "${pkgdir}"/usr/share/AutoFirmaJA/*.txt "${pkgdir}"/usr/share/AutoFirmaJA/openssl.*
}
