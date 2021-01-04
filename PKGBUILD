# Maintainer: Alberto Gómez <no publicado>
# Maintainer: Víctor González <mrvikxd@gmail.com>

pkgname=autofirmaja
pkgver=1.6.0_jav2
pkgrel=1
pkgdesc='Junta de Andalucia cliente de firma digital andaluz'
arch=('i686' 'x86_64')
url='https://ws024.juntadeandalucia.es/clienteafirma/autofirma/autofirma.html'
license=('GPL' 'EUPL')
depends=('java-runtime' 'nss' 'firefox')
makedepends=('binutils' 'openssl')
source=("${pkgname}-${pkgver}.deb::https://ws024.juntadeandalucia.es/ae/descargar/5679")
sha512sums=('073aa69caf26209706ec703dc12b7dcf99e205f1d96345c94607380dff9ea49a0e8614dfed86acfe8ae932c3a42a4c0dd1574b72eaa26e96cccea24e9b59b376')

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
