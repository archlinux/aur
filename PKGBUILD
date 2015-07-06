# Maintainer: Joe George <joe at externl dot com>
# Contributor: Daniel Spies <ds20150201aur at pskx dot net>
# Contributor: Otto Allmendinger <otto.allmendinger@gmail.com>

pkgname=(
	"zeroc-ice"
	"zeroc-ice-php"
	"zeroc-ice-python2"
	"zeroc-ice-python"
	"zeroc-ice-java"
)
pkgbase=("zeroc-ice")
pkgver=3.5.1
pkgrel=3
pkgdesc="An object-oriented middleware that provides object-oriented Remote Procedure Call functionality"
arch=("i686" "x86_64")
url="https://zeroc.com"
license=("GPL" "custom:ICE license")
makedepends=(
	"mcpp>=2.7.2"
	"python2>=2.7.0" "python2<2.8.0"
	"python>=3.4.0" "python<3.5.0"
	"php" "bzip2"
	"proguard>=4.8" "apache-ant" "java-environment" "java-berkeleydb>=5.3"
)
#depends=("openssl>=0.9.8" "expat>=2.0" "python" "mcpp>=2.7.2")
depends=("python" "mcpp>=2.7.2")
_depends_zeroc_ice_python2=("zeroc-ice" "python2>=2.7.0" "python2<2.8.0")
_depends_zeroc_ice_python=("zeroc-ice" "python>=3.4.0" "python<3.5.0")
_depends_zeroc_ice_php=("zeroc-ice" "php")
_depends_zeroc_ice_java=("zeroc-ice" "java-environment")

source=(
	"http://www.zeroc.com/download/Ice/${pkgver:0:3}/Ice-${pkgver}.tar.gz"
        "https://repo.zeroc.com/nexus/service/local/repositories/thirdparty/content/com/jgoodies/jgoodies-common/1.8.0/jgoodies-common-1.8.0.jar"
	"https://repo.zeroc.com/nexus/service/local/repositories/thirdparty/content/com/jgoodies/jgoodies-forms/1.8.0/jgoodies-forms-1.8.0.jar"
	"https://repo.zeroc.com/nexus/service/local/repositories/thirdparty/content/com/jgoodies/jgoodies-looks/2.6.0/jgoodies-looks-2.6.0.jar"
	"cpp_Make.rules.patch"
	"python2_Make.rules.patch"
	"python3_Make.rules.patch"
	"java_build.properties.patch"
	"php_Make.rules.php.patch"
	"java8-compatibility.patch"
)

sha256sums=('989e51194c6adadbd156da3288e37bad847b93b3b876502e83033b70493af392'
            'bc2336a74aaf7233aae156a1750953941248544247ff0d97fa58d84e3ebf0735'
            'a2ae46793814fa6c42dabb561c59336029907a3c03d1b82f977f1ed6a4e5011e'
            '536fb1e76cf49c76ca336368b1d133294bc48358be6fc5160087a60d38599227'
            'ad4389c587fe950443b2d0d333fc60c1374bee66b01f6d2903ee1f6c0aa4931e'
            'd2204ab885f15e5b94dbcb5a50f73acfd2591056eef74a8a8cf3347d8f709d3f'
            '53a5b87a0d5d0c0a6eca345cdaea0ff01e27bab031ade2ace7f2109ed10868f6'
            '5e39f40bd64305d6363c4336757b26988f3bde4549afa360a6407c440659a156'
            '63030fa037e064535ea5b94652ee03b88af475906759592d26c2fb856c716d05'
            '6c33a6f5622678100f2b22b22cb9ce07d65320f9d6dec828d8fe2d847d9068cd')

_build_common() {
    #cd ${srcdir}/${_makedir}/cpp/src

	 warning "This is a Split Package!"
    msg2 "to only build selected parts, use "
    msg2 "$ makepkg --pkg=foo"
    msg2 "to build this package"

    #make OPTIMIZE=yes embedded_runpath_prefix=""
}

_package_common() {
	install -Dm644 ${srcdir}/Ice-${pkgver}/ICE_LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

_build_cpp() {
	cd ${srcdir}/Ice-${pkgver}/cpp

	msg "Building Ice for C++"
	msg2 "Patching make rules..."
	patch config/Make.rules < ${srcdir}/cpp_Make.rules.patch
	msg2 "Compiling..."
	make
}

_package_cpp() {
   cd ${srcdir}/Ice-${pkgver}/cpp

	msg "Installing Ice for C++"
	make DESTDIR="${pkgdir}/" install

	msg2 "Installing ICE License..."
	_package_common
	
	msg2 "Cleaning up..."
	rm -f  ${pkgdir}/usr/lib/ImportKey.class

	if [ $CARCH = "x86_64" ]; then
		# NOTE: ${pkgdir}/usr/lib/ should already be empty 
		#       for x86_64 otherwise something has gone wrong
		rm -df ${pkgdir}/usr/lib/
		mv ${pkgdir}/usr/lib64/ ${pkgdir}/usr/lib/
	fi

	rm -rf ${pkgdir}/usr/config/
	rm -f  ${pkgdir}/usr/CHANGES
	rm -f  ${pkgdir}/usr/ICE_LICENSE
	rm -f  ${pkgdir}/usr/LICENSE
	rm -f  ${pkgdir}/usr/RELEASE_NOTES
}

_build_php() {
   cd ${srcdir}/Ice-${pkgver}/php

	msg "Building Ice for PHP"
	msg2 "Patching make rules..."
	patch config/Make.rules.php < ${srcdir}/php_Make.rules.php.patch
	msg2 "Compiling..."
	make
}

_package_php() {
   cd ${srcdir}/Ice-${pkgver}/php

	msg "Installing Ice for PHP"
	install -dm755 ${pkgdir}/usr/lib/php/modules/
	install -Dm755 lib/IcePHP.so ${pkgdir}/usr/lib/php/modules/IcePHP.so

	install -dm755 ${pkgdir}/etc/php/conf.d/
	echo "extension = IcePHP.so" > ${pkgdir}/etc/php/conf.d/ice.ini
	echo "include_path=${include_path}:/usr/share/Ice-${pkgver}/php/" > ${pkgdir}/etc/php/conf.d/ice.ini

	install -dm755 ${pkgdir}/usr/share/Ice-${pkgver}
	cp -r lib ${pkgdir}/usr/share/Ice-${pkgver}/php

	msg2 "Installing ICE License..."
	_package_common
	
	msg2 "Cleaning up..."
	rm -f ${pkgdir}/usr/share/Ice-${pkgver}/php/Makefile
	rm -f ${pkgdir}/usr/share/Ice-${pkgver}/php/.depend
	rm -f ${pkgdir}/usr/share/Ice-${pkgver}/php/IcePHP.so
}

_build_python2() {
	mkdir -p ${srcdir}/Ice-${pkgver}/py2
	cp -r ${srcdir}/Ice-${pkgver}/py/* ${srcdir}/Ice-${pkgver}/py2/
   cd ${srcdir}/Ice-${pkgver}/py2

	msg "Building Ice for Python2"
	msg2 "Patching make rules..."
	patch -N config/Make.rules < ${srcdir}/python2_Make.rules.patch
	msg2 "Compiling..."
	make
}

_package_python2() {
	cd ${srcdir}/Ice-${pkgver}/py2
	
	msg "Installing Ice for Python2"
	make DESTDIR="${pkgdir}/" install

	msg2 "Installing ICE License..."
	_package_common

	msg2 "Cleaning up..."
	rm -f ${pkgdir}/usr/CHANGES
	rm -f ${pkgdir}/usr/ICE_LICENSE
	rm -f ${pkgdir}/usr/LICENSE
	rm -f ${pkgdir}/usr/RELEASE_NOTES
	rm -rf ${pkgdir}/usr/share/Ice-${pkgver}

	if [ $CARCH = "x86_64" ]; then
		mv ${pkgdir}/usr/lib64/ ${pkgdir}/usr/lib/
	fi
}

_build_python() {
	mkdir -p ${srcdir}/Ice-${pkgver}/py3
	cp -r ${srcdir}/Ice-${pkgver}/py/* ${srcdir}/Ice-${pkgver}/py3/
	cd ${srcdir}/Ice-${pkgver}/py3

	msg "Building Ice for Python3"
	msg2 "Patching make rules..."
	patch -N config/Make.rules < ${srcdir}/python3_Make.rules.patch
	msg2 "Compiling..."
	make
}

_package_python() {
	cd ${srcdir}/Ice-${pkgver}/py3
	
	msg "Installing Ice for Python3"
	make DESTDIR="${pkgdir}/" install

	msg2 "Installing ICE License..."
	_package_common

	msg2 "Cleaning up..."
	rm -f ${pkgdir}/usr/CHANGES
	rm -f ${pkgdir}/usr/ICE_LICENSE
	rm -f ${pkgdir}/usr/LICENSE
	rm -f ${pkgdir}/usr/RELEASE_NOTES
	rm -rf ${pkgdir}/usr/share/Ice-${pkgver}
	
	if [ $CARCH = "x86_64" ]; then
		mv ${pkgdir}/usr/lib64/ ${pkgdir}/usr/lib/
	fi
}

_build_java() {
	cd ${srcdir}/Ice-${pkgver}/java
	
	msg "Building Ice for Java"
    	msg2 "Exporting Java BerkeleyDB..."
       
   	#_java_deps=(berkeleydb jgoodies-common jgoodies-forums jgoodies-looks)
   	_java_deps=(berkeleydb)
   	for jpkg in $_java_deps; do
       		for jar in /usr/share/java/${jpkg}/*.jar; do
           		CLASSPATH=${CLASSPATH}:${jar}
       		done
    	done
 	for jar in ${srcdir}/*.jar; do
		CLASSPATH=${CLASSPATH}:${jar}
	done 
    	export CLASSPATH
   	msg2 "Patching make rules..."
    	patch config/build.properties < ${srcdir}/java_build.properties.patch
	msg2 "Patching Java 8 name conflict..."
	patch src/IceInternal/OutgoingConnectionFactory.java < ${srcdir}/java8-compatibility.patch
	msg2 "Compiling..."
   	ant -Dprefix="${pkgdir}/usr/share/java/zeroc-ice/"
}

_package_java() {
	cd ${srcdir}/Ice-${pkgver}/java

	msg "Installing Ice for Java"
	install -dm755 ${pkgdir}/usr/share/java/zeroc-ice/
	ant -Dprefix="${pkgdir}/usr/share/java/zeroc-ice/" install
	
	msg2 "Installing ICE License..."
   _package_common

	msg2 "Cleaning up..."
	rm -f  ${pkgdir}/usr/share/java/zeroc-ice/ICE_LICENSE
	rm -f  ${pkgdir}/usr/share/java/zeroc-ice/LICENSE
}

build() {
	_build_common
	_build_cpp
}

package_zeroc-ice() {
	_package_cpp
}

package_zeroc-ice-php() {
	depends=("${_depends_zeroc_ice_php[@]}")
   _build_php
   _package_php
}

package_zeroc-ice-python2() {
	depends=("${_depends_zeroc_ice_python2[@]}")
   _build_python2
   _package_python2
}

package_zeroc-ice-python() {
	depends=("${_depends_zeroc_ice_python[@]}")
   _build_python
   _package_python
}

package_zeroc-ice-java() {
	depends=("${_depends_zeroc_ice_java[@]}")
	arch=("any")
   _build_java
   _package_java
}
