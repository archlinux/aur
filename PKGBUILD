# Maintainer: Tambet Arak <tambet dot arak at gmail>

# PKGBUILD for the *latest stable* version of mod_pagespeed. Replace
#
# "git checkout latest-stable" with
# "git checkout master"
#
# to build the bleeding edge.

pkgname=mod_pagespeed-git
pkgver=1.10.33.5
pkgrel=1
pkgdesc="Google's httpd module to optimize serving web sites"
arch=('i686' 'x86_64')
url="https://developers.google.com/speed/pagespeed/module/"
license=('Apache')
depends=('apache>=2.4.2')
makedepends=('git>=1.8 subversion>=1.8 python2>=2.7 gperf>=3.0 depot-tools-git unzip')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=('etc/httpd/conf/extra/pagespeed.conf')
install="mod_pagespeed.install"
source=('git+https://github.com/pagespeed/mod_pagespeed.git')
md5sums=('SKIP')

pkgver() {
	cd $srcdir/mod_pagespeed
	git checkout latest-stable
	TAG=$(git describe --tags --match='[1-9]*' --abbrev=0)
	git checkout $TAG
	echo $TAG
}

prepare() {

	# Symlink python2 -> python to force using python2

	cd $srcdir
	export PATH=/opt/depot-tools-git/:$PATH # just in case depot_tools isn't in $PATH
	gclient.py config https://github.com/pagespeed/mod_pagespeed.git --unmanaged --name=src
	ln -sf $(which python2) python && export PATH=$(pwd):$PATH
	gclient.py sync --force --jobs=1
}

build() {
	cd $srcdir/src
	make AR.host=`pwd`/build/wrappers/ar.sh AR.target=`pwd`/build/wrappers/ar.sh BUILDTYPE=Release
}

check() {
	cd $srcdir/src
	make AR.host=`pwd`/build/wrappers/ar.sh AR.target=`pwd`/build/wrappers/ar.sh BUILDTYPE=Release \
		mod_pagespeed_test pagespeed_automatic_test
	./out/Release/mod_pagespeed_test
	./out/Release/pagespeed_automatic_test
}

package() {
	cd $srcdir/src/install
	echo > debug.conf.template
	make STAGING_DIR=$(pwd)/staging staging
	cd staging

	install -d $pkgdir/{etc/httpd/conf/extra,usr/bin,usr/lib/httpd/modules,var/cache/mod_pagespeed}
	install -m755 -t $pkgdir/usr/bin pagespeed_js_minify
	install -m644 -t $pkgdir/etc/httpd/conf/extra pagespeed.conf pagespeed_libraries.conf
	install -m755 mod_pagespeed_ap24.so $pkgdir/usr/lib/httpd/modules/mod_pagespeed.so
}

