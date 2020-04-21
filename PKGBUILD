# Maintainer: Igor Lakic aka trzalica <trzalica87 at gmail dot com>
# Contributor: Rob McCathie <archaur at rmcc dot com dot au>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

_name=apache
pkgname=apache22
pkgver=2.2.34
pkgrel=1
pkgdesc='A high performance Unix-based HTTP server'
arch=('i686' 'x86_64')
url='http://www.apache.org/dist/httpd'
license=('APACHE')
backup=(etc/httpd/conf/httpd.conf
        etc/httpd/conf/extra/httpd-{autoindex,dav,default,info,languages}.conf
        etc/httpd/conf/extra/httpd-{manual,mpm,multilang-errordoc}.conf
        etc/httpd/conf/extra/httpd-{ssl,userdir,vhosts}.conf
        etc/conf.d/apache
        etc/logrotate.d/httpd)
depends=('openssl' 'zlib' 'apr-util' 'pcre' 'systemd')
optdepends=('lynx: apachectl status')
provides=("$_name=$pkgver")
conflicts=("$_name")
install=apache.install
_itkurl=http://mpm-itk.sesse.net/apache2.2-mpm-itk-2.2.17-01
source=(https://archive.apache.org/dist/httpd/httpd-${pkgver}.tar.bz2
        ${_itkurl}/02-rename-prefork-to-itk.patch
        ${_itkurl}/03-add-mpm-to-build-system.patch
        ${_itkurl}/04-correct-output-makefile-location.patch
        ${_itkurl}/05-add-copyright.patch
        ${_itkurl}/06-hook-just-after-merging-perdir-config.patch
        ${_itkurl}/07-base-functionality.patch
        ${_itkurl}/08-max-clients-per-vhost.patch
        ${_itkurl}/09-capabilities.patch
        ${_itkurl}/10-nice.patch
        ${_itkurl}/11-fix-htaccess-reads-for-persistent-connections.patch
        apachectl-confd.patch
        apache.conf.d
        apache.tmpfiles.conf
        httpd.logrotate
        httpd.service
        arch.layout)
sha512sums=('e6dac5865a48533c025fe17523ee74d68c3a23f9512c9441b78a140e33cfb6835573eb049b0ad424eb5c5ca78a1915778c54e8a409da95fbdd3890cb99e08240'
            '8e6e7759a7dc711e2936c05b6c1f89b8b2efe499ee9b8b503e9c06fd319de51c3bb9910a416b1747b4447b47162e7b3ab45b8858a3bab67a1238b034696c72e3'
            'd3749ff6e06030c08779d97e715be06a191bbfdeb5907957f396c2df87b46ddc242f76a61dd7d1ae625acc1a9a96ff7cb626497cba36f434d3369a03362cd262'
            '2b725c8d312bb6d26619fced90945557d0d0af28811795860984f08f94a49e01f8656e04412bd6e987e182fc1d84d5fb10efc693a3838b9a04244c1b0dc4105e'
            '98dfec1054074cfa90daf36cf41be115f4ea63f953e26c5df81476344cda62e009614549328841a775dee4aa3b8cc169333b65940395bb70ef2c0702a97bf754'
            'eb88374eca43620eea69968e8c677327bdb71963ddb892f23755040619c7b663ebdc2b8fc43fb43d91cb4bfef8c87056cefa009f32934202e395e0f09de04661'
            'd3dd6a4c5538ae9ae5a145d781799423597bbac86d74c898eb57dc2accbd66ab92843c046df855c89a8cc4a9a6be7a2859d59c4b347e43dc76aedb3f86e251fe'
            '5ca0c5a613a21f2cfc055d2b351ca66923b2d66aabd257e646deb2d150db2ee60d4a4374028708ef3be814d0ebfb5f137dac6d29c8ecea91e34d3f366792e894'
            '14bbceb2ce9376fa9067f853024cbeb10470613683c907b6392b6ce3d958dcfe2f46902952f0984571560e6477e28fa7923370f492efe27bc87df915acb2bffa'
            '569bea3dffbedbc37e9564909497c84df3584fcbf100194f7761c9259524cdd9f125db044030cc5f9dfddb95e49b4631b86384b6320c8a0bbe2c314e42c962fe'
            'ebffac6a8a31a1fc18ad7b2d1a69dcd55da6dbe45ba6fe9ef56163b804950f8a6d06583d98755781c5c639c5b8fda9f2b8ffa4dda823270178caf7b156169083'
            '64d13dbcf8f7be02cd5d17dd6174cb2be594d04c45cebdaba974c74ff5b5abfa869fc7f9bfcf43fa9cea819eae7605f67501050afea60ebe91463c0152f438ae'
            '89a60c44564ba265f8f1afee06b65bcd11c0ce3ece33fb9e8f91d919605a852181c8bf31323986be4d39038f69a160f1176e794141ebb706cc3451d2fbc9101d'
            '57fece1a3e4e3cbd6135203172ecf32570405f7205dc84adc076a50cdab20db868270d8e658314f5273616f81b356d7b88c31e0ee8a8ce6a3e77ab15ef6a8f36'
            'cd64a6652ad015eb26d7a0e8d8da8fe4ca9228b490a0cdb357e0a015a2153e1d699a9669b96fe7b3951b70e326a940c7fd01e1d3dbafc0dff741abe4ade786f3'
            '31cc2caefb37021deaf4ed18619160e67f239c1075cc2868f351660b1c04a124d1fe2d98e67d1b4b23cf4e46fadde2b3466bcd14d83765a0779caf4d173cfd35'
            'eec751f171b91b589d61a579ec85c2c2fae84a158a9d14ebabe37a587f1aa884b97c701d611d55960c11e1aea82d18f4e56dcb60c48cdd1daa82c5429d59de38')

build() {
	cd "${srcdir}/httpd-${pkgver}"

	patch -Np0 -i "${srcdir}/apachectl-confd.patch"

	# set default user
	sed -e 's#User daemon#User http#' \
	    -e 's#Group daemon#Group http#' \
	    -i docs/conf/httpd.conf.in

	cat "${srcdir}/arch.layout" >> config.layout

	cd ..
	cp -r httpd-${pkgver} httpd-itk-${pkgver}

	cd httpd-itk-${pkgver}
	
	# Fix patch to apply with latest Apache version
	sed -i -e 's/mpmt_os2}/mpmt_os2|winnt}/g' "${srcdir}/03-add-mpm-to-build-system.patch"

	mkdir -p server/mpm/experimental/itk
	cp -r server/mpm/prefork/* server/mpm/experimental/itk/
	mv server/mpm/experimental/itk/prefork.c server/mpm/experimental/itk/itk.c

	patch -Np1 -i "${srcdir}/02-rename-prefork-to-itk.patch"
	patch -Np1 -i "${srcdir}/03-add-mpm-to-build-system.patch"
	patch -Np1 -i "${srcdir}/04-correct-output-makefile-location.patch"
	patch -Np1 -i "${srcdir}/05-add-copyright.patch"
	patch -Np1 -i "${srcdir}/06-hook-just-after-merging-perdir-config.patch"
	patch -Np1 -i "${srcdir}/07-base-functionality.patch"
	patch -Np1 -i "${srcdir}/08-max-clients-per-vhost.patch"
	patch -Np1 -i "${srcdir}/09-capabilities.patch"
	patch -Np1 -i "${srcdir}/10-nice.patch"
	patch -Np1 -i "${srcdir}/11-fix-htaccess-reads-for-persistent-connections.patch"

	autoconf
	cd ..
	for mpm in prefork worker itk; do
		if [ "${mpm}" = "itk" ]; then
			CONFIGURE=../httpd-itk-${pkgver}/configure
		else
			CONFIGURE=../httpd-${pkgver}/configure
		fi

		mkdir build-${mpm}
		pushd build-${mpm}
		$CONFIGURE --enable-layout=Arch \
			--enable-modules=all \
			--enable-mods-shared=all \
			--enable-so \
			--enable-suexec \
			--with-suexec-caller=http \
			--with-suexec-docroot=/srv/http \
			--with-suexec-logfile=/var/log/httpd/suexec.log \
			--with-suexec-bin=/usr/bin/suexec \
			--with-suexec-uidmin=99 --with-suexec-gidmin=99 \
			--enable-ldap --enable-authnz-ldap \
			--enable-cache --enable-disk-cache --enable-mem-cache --enable-file-cache \
			--enable-ssl --with-ssl \
			--enable-deflate --enable-cgid \
			--enable-proxy --enable-proxy-connect \
			--enable-proxy-http --enable-proxy-ftp \
			--enable-dbd \
			--with-apr=/usr/bin/apr-1-config \
			--with-apr-util=/usr/bin/apu-1-config \
			--with-pcre=/usr \
			--with-mpm=${mpm}
		make
		popd
	done
}

package() {
	cd "${srcdir}"
	cd build-prefork
	make DESTDIR="${pkgdir}" install
	cd ..
	
	install -m755 build-worker/httpd "${pkgdir}/usr/bin/httpd.worker"
	install -m755 build-itk/httpd "${pkgdir}/usr/bin/httpd.itk"

	install -D -m644 "${srcdir}/httpd.logrotate" "${pkgdir}/etc/logrotate.d/httpd"
	install -D -m644 "${srcdir}/apache.conf.d" "${pkgdir}/etc/conf.d/apache"
	install -D -m644 "${srcdir}/apache.tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/apache.conf"

	# symlinks for /etc/httpd
	ln -fs /var/log/httpd "${pkgdir}/etc/httpd/logs"
	ln -fs /run/httpd "${pkgdir}/etc/httpd/run"
	ln -fs /usr/lib/httpd/modules "${pkgdir}/etc/httpd/modules"
	ln -fs /usr/lib/httpd/build "${pkgdir}/etc/httpd/build"

	# set sane defaults
	sed -e 's#/usr/lib/httpd/modules/#modules/#' \
	    -e 's|#\(Include conf/extra/httpd-multilang-errordoc.conf\)|\1|' \
	    -e 's|#\(Include conf/extra/httpd-autoindex.conf\)|\1|' \
	    -e 's|#\(Include conf/extra/httpd-languages.conf\)|\1|' \
	    -e 's|#\(Include conf/extra/httpd-userdir.conf\)|\1|' \
	    -e 's|#\(Include conf/extra/httpd-default.conf\)|\1|' \
	    -i "${pkgdir}/etc/httpd/conf/httpd.conf"

	# cleanup
	rm -rf "${pkgdir}/usr/share/httpd/manual"
	rm -rf "${pkgdir}/etc/httpd/conf/original"
	rm -rf "${pkgdir}/srv/"
	rm -rf "${pkgdir}/run"

        install -m755 -d "${pkgdir}/usr/lib/systemd/system"
        install -m644 "${srcdir}/httpd.service" "${pkgdir}/usr/lib/systemd/system/"
}
