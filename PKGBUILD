# Maintainer: John Regan <john@jrjrtech.com>
# Contributor: Daurnimator <quae@daurnimator.com>

pkgname='lua-cqueues'
pkgver=20200726
_lua_compat_ver=0.15.1
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc='Continuation Queues: Embeddable asynchronous networking, threading, and notification framework for Lua 5.5'
url='http://25thandclement.com/~william/projects/cqueues.html'
license=('MIT')
depends=("lua>=5.5" "lua<5.6" 'openssl')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/wahern/cqueues/archive/rel-$pkgver.tar.gz"
  "lua-compat-5.3-${_lua_compat_ver}.tar.gz::https://github.com/lunarmodules/lua-compat-5.3/archive/refs/tags/v${_lua_compat_ver}.tar.gz"
  '100-add-lua-55.patch'
  '200-fix-calloc-order.patch'
  '201-remove-uneeded-initialization.patch'
  '202-use-minus-one-for-1bit-fields.patch'
  '300-remove-deprecated-pushunsigned.patch'
  '400-fix-warning-about-unused-kfunction-args.patch'
  '500-fix-compatible-pointer-signal.patch'
  '600-fix-pushvfstring-can-return-null.patch'
)

prepare() {
	cd "cqueues-rel-$pkgver"

    # pull in patches for lua5.5 support and minor fixes
    patch -Np1 -i ../100-add-lua-55.patch
    patch -Np1 -i ../200-fix-calloc-order.patch
    patch -Np1 -i ../201-remove-uneeded-initialization.patch
    patch -Np1 -i ../202-use-minus-one-for-1bit-fields.patch
    patch -Np1 -i ../300-remove-deprecated-pushunsigned.patch
    patch -Np1 -i ../400-fix-warning-about-unused-kfunction-args.patch
    patch -Np1 -i ../500-fix-compatible-pointer-signal.patch
    patch -Np1 -i ../600-fix-pushvfstring-can-return-null.patch

    # override the included compat53 module with latest release (fixes 5.5 support)
    rm -rf vendor/compat53
    cp -R ../lua-compat-5.3-${_lua_compat_ver} vendor/compat53
}

build() {
	cd "cqueues-rel-$pkgver"
	make prefix=/usr LUA_APIS='5.5'
}

package() {
	cd "cqueues-rel-$pkgver"
	make DESTDIR="$pkgdir" prefix=/usr LUA_APIS=5.5 install5.5
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 doc/cqueues.pdf "$pkgdir/usr/share/doc/$pkgname/cqueues.pdf"
}

sha512sums=(
'f2198a2a887bca445fe480949e05ecc94c3112827dbd65d2de0258316beee12f6052fa2670560daab708421e669dde0ac581b365af6bb94a3fc6f322c8bc7547'
'6b17213321a08268228a97180e08289b85d6554b25cac89f7b7f72e79be0169af233fade87718b4a68485e0357dcb34245e660222e5c9d06254b0f3b64ef19cd'
'e189f94cbbca79fcc07a83dc10a37193a74fec69848a845f3fbaacfa58ac4698288a57a5e74463dd366b6ac2dc7af7ce98e9a6300291fef6b7635478e8bf60f0' #  100-add-lua-55.patch
'3cec16feee54c71a0d17cdafadac6a1f6356bf9a5bfb8fd276bbdb6f22665e9b62b935c8b86aa06f5329bdeeecaec79da1954bac76f8fbbc5b4b1f415d4b89f2' #  200-fix-calloc-order.patch
'dd7897e41f6e024ea2d4b5feec867ffb2aeb7d5ae81230f23874ea7bda17730c9a98e9271f5950bda5d3147fe58ce7463847b64628b0d3ddeab71f3d7864096c' #  201-remove-uneeded-initialization.patch
'72386ce8364cbbbd3e46903e40d56805db9259305ed378cdeadaf32ef5f4decc7f3d471914daa8455751c4349884f3d1bbb762cb99e1a7b7330b34adb137d050' #  202-use-minus-one-for-1bit-fields.patch
'32e5bb98f1046228229d9d0d40bec0afca7447f0e0bede226fe0a92449837ff1f63ffca18d5d6e065c60509b78fab337b0116a22aa378056d5b535e4b6383544' #  300-remove-deprecated-pushunsigned.patch
'66f3c3437dc2b2ad5fa61d324786fe885b6cae415a8dd4f633964ebcd7366044ff9f01e94faa867d791e183b7c87e80028abe074a77df24906516b661946d83f' #  400-fix-warning-about-unused-kfunction-args.patch
'2026facd48637cd27f3b9bfef3e1c87f688ba5144d7fdc50ec73268dfa33190dc3ec57fb6c8f4bba43aa1db5b49d761b857f94c9a0797671faa81ff6fb20ef17' #  500-fix-compatible-pointer-signal.patch
'c0cec8b50e2310fe58cfe5f84d18559588574fcdc561f721c0fba00d4c9c48a69c3d03bb932960e58877b65175084e84d9e6ba509dd5bc0272493b6e0fdf5782' #  600-fix-pushvfstring-can-return-null.patch
)
