# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
pkgname=inviwo
pkgver=0.9.9
pkgrel=1
pkgdesc="Software framework for rapid visualization prototyping"
arch=('x86_64')
url="http://www.inviwo.org/"
license=('BSD')
depends=('qt5-base>=5.3' 'python')
makedepends=('cmake')
_icon_url='https://avatars1.githubusercontent.com/u/10848351'
source=("http://weber.itn.liu.se/~ricen76/inviwo/v${pkgver}/inviwo-v${pkgver}-src.tar.gz"
	"inviwo.desktop"
	"inviwo.sh"
	"icon_24.png::${_icon_url}?s=24"
	"icon_32.png::${_icon_url}?s=32"
	"icon_48.png::${_icon_url}?s=48"
	"icon_72.png::${_icon_url}?s=72"
	"icon_256.png::${_icon_url}?s=256")
sha512sums=('6b034d2e48ab4edeb966c5d5d570c281ea104273cbb68d78949e5819d8ca365e8a5bedef562c4f2871915c9bc6f4b5971a70a1dfa1208d73b66ac0cd5c506762'
            '97681c94e09fbace0b470599bc7d5954fa89776d30b738dd48814ffb9ff3a1c428bd5f6fe5785e43a633fcaf48dfbb600e92ecf571c49c99a28dd76b9945a745'
            '890caae628ff011dfe67a2b2aea9afc7c40f87f21cebb9c3ef43c1f7d9b93fd94ebd4dc943c67958198eef7c6ab3c476e887a4b5258563a6d0804b27c725ba70'
            '6e5e357bc9f0f9d477f5325f850042ed98aee9adba0515a527d5ff94854e1318a236adea029e8aead429046ccb371dff658065c12c331deb002e80175b0bc510'
            '01f7089949279e0fe5f3131484ad8c8854e053614ad7430c779c81ab13b10f3ffb28fd8e1ff5072d2aa036fc983e16c37b54daf583c4991c26dc8c392cb21c60'
            'ba1e53a6dc6e109e1b8fd54f32e2bfe2755c6697b8750c468947e4410ed843df90a2c541e1771fecbadc1f05969fb4bf094e7590709e8b3919e08cc796685ced'
            '7a879df4bc4fa04d3048aa9c7f2c763eebcc1a224c5afc1e8f14512c8da09422e72655d82d597665455960defce7266d013b9fc35b36f88426c192c8dc4f7141'
            'd018ef5a502fcc2e21d40450d73094bb705d42c8dea0ebb1d27b7a0df43626f931700a0511b29ba31287ef6795b59569b4a79457553701aa47983ede8dbd39c9')

_sources="var/lib/jenkins/workspace/Public/Inviwo-public/$pkgname"

prepare() {
	cd "$srcdir/$_sources"
	
	# do not try to use the source folder as base path for the executable 
	sed -i 's,IVW_TRUNK,std::string("/opt/inviwo"),' src/core/util/filesystem.cpp

    mkdir build || :
    cd build

    cmake .. -DCMAKE_INSTALL_PREFIX:PATH="/opt/inviwo"
}

build() {
	cd "$srcdir/$_sources/build"
    make
}

package() {
	cd "$srcdir/$_sources/build"

	_install="$pkgdir/opt/inviwo"
	mkdir -p "$_install" "$pkgdir/usr/bin"
	cp -r bin "$_install/bin"
	cp -r lib "$_install/lib"

	install -Dm755 $srcdir/inviwo.sh "$_install/bin/."
	ln -s /opt/inviwo/bin/inviwo.sh "$pkgdir/usr/bin/inviwo"

	cd "$srcdir/$_sources"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	cp -r data "$_install/data"
	cp -r resources "$_install/resources"
	cp -r tools "$_install/tools"
	cp -r include "$_install/include"
	cp -r modules "$_install/modules"

	cd "$srcdir"

	for res in 24 32 48 72 256; do
		install -Dm644 \
			"icon_$res.png" \
			"${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/inviwo.png"
	done

	install -Dm644 \
		inviwo.desktop \
		"$pkgdir/usr/share/applications/inviwo.desktop"
}

