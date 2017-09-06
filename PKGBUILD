# Maintainer: Thibaud Kehler <Thibaud dot Kehler at gmx dot net>

pkgname=lenskit
pkgver=2.2.1
pkgrel=1
pkgdesc="An open source toolkit for building, researching, and studying recommender systems."
arch=('any')
url="http://lenskit.org/"
license=('LGPL')
depends=('bash' 'java-runtime-headless')

source=(https://dl.bintray.com/${pkgname}/${pkgname}-releases/${pkgname}-${pkgver}.tgz
		lenskit
		lenskit-eval)
md5sums=('e453d071c857d276aef7149b3efd3561'
         'd0b13f1da93d38c7d91a7910f792c664'
         'dbeaa442d3e0df2de066d7b2594f9c58')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
	_apphome=/usr/share/java/${pkgname}
	#Jar-files
	for jar in $(find lib -name "*.jar"); do
        install -Dm644 "${jar}" "${pkgdir}${_apphome}/${jar}"
    done

	#Licence
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	
	cd man
	
	#Man (1)
	for man in $(find -name "*.1"); do
		install -Dm644 "${man}" "${pkgdir}/usr/share/man/man1/${man}"
	done

	#Man (7)
	for man in $(find -name "*.7"); do
		install -Dm644 "${man}" "${pkgdir}/usr/share/man/man7/${man}"
	done
	cd ..

	mkdir -p "${pkgdir}/usr/share/doc/lenskit"
	cp -r javadoc "${pkgdir}/usr/share/doc/lenskit/"
	
	cd "${srcdir}" 
	
	#Binaries
	install -Dm755 lenskit "${pkgdir}${_apphome}/bin/lenskit"
	install -Dm755 lenskit-eval "${pkgdir}${_apphome}/bin/lenskit-eval"
	mkdir -p "${pkgdir}/usr/bin"
	ln -s "${_apphome}/bin/lenskit" "${pkgdir}/usr/bin/lenskit"
	ln -s "${_apphome}/bin/lenskit-eval" "${pkgdir}/usr/bin/lenskit-eval"
}
