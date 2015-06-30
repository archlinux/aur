# Maintainer: Igor Lakic aka trzalica <trzalica87 at gmail dot com>
# Contributor: Rob McCathie <archaur at rmcc dot com dot au>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

_name=apache
pkgname=apache22
pkgver=2.2.29
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
source=(http://www.apache.org/dist/httpd/httpd-${pkgver}.tar.bz2
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
md5sums=('579342fdeaa7b8b68d17fee91f8fab6e'
         'f1d9d41360908ceb2374da55ae99197a'
         'cdfa04985a0efa850976aef01c2a0c40'
         '0930d2d0612eb0a53a0d00aea7e8687f'
         '3a0c29bb91442c33ea73ebbe072af922'
         '0ef4729a6f1ffc848ad0e9b440a66f66'
         '940944caa948340b11ddae56adaef89b'
         'ce09a987523884de8838f73dc8ec0d19'
         'e75b7dd8d8afcd299ba4ab2ab81c11e4'
         'ce1ccc21f3ad8625169c8f62913450ac'
         '1e5b222edcfbf99a3edc56fcb2074fbe'
         '4ac64df6e019edbe137017cba1ff2f51'
         '08b3c875f6260644f2f52b4056d656b0'
         '82068753dab92fe86312b1010a2904d7'
         '13dbaaf949c5bc36cfcf5718b95cb020'
         'a823bb355c136fd0e2b3fb820e2d903c'
         '6b7122245a67597230a3b3f317eaf34e')

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
