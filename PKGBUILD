# Maintainer: Joey Dumont <joey.dumont@gmail.com>
pkgname=gz-git
pkgver=20180111
pkgrel=1
arch=('any')
pkgdesc="Ocarina of Time trainer ROM - git version"
url="https://github.com/glankk/gz"
source=("git+https://github.com/glankk/gz.git"
        "make.lua.patch"
        "make-rom"
        "make-patch"
        "patch")
sha512sums=('SKIP'
            '92670d1ab6b35ff989f371f876c2bda5be94d14989981b0a81088754396e3acf458d2293acf3270ff6580ec33e46a0f887fe7131389bf433b845b5d0f0442e13'
            'fe612428950d721ffd28c54eae723f682fe8029526bae77ad5a185d0702a07e079565ca0ff172716614690fd4697d2b27a0207270d12c154c2eadf88815c2e34'
            'b9890be8830aa46ade9eb2a425329ac5a134ac8f6b52c96a90dac34a4874973a01bb3f305416ed052e595b0dc90cf22c11ac0275acf96b61119ad91be783d968'
            'f363811c4c9459bfa27b878927050bb50e3cbcd9cb4f7e4359f127568fa6980b76cccae5a37f1a612dab532c0624926a139769667b9e530571c779242ba691bf')
options=('!buildflags' '!strip')
depends=('mips64-gcc-n64' 'n64-toolchain')
conflicts=('gz')
provides=('gz')

# Local variables.
_installdir=/opt/n64-dev/gz/

pkgver() {
  # Identify latest version.
  cd "$srcdir/gz"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

prepare() {
  cd $srcdir/gz
  patch -p2 -i "${srcdir}/make.lua.patch"
}

build() {
  # cd to source directory.
  cd $srcdir/gz

  export PATH=/opt/n64-dev/usr/bin:$PATH
  make CFLAGS+="-I/opt/n64-dev/n64-sysroot/include" LDSCRIPT="/opt/n64-dev/n64-sysroot/lib/gl-n64.ld"
}

package() {
  # gz assumes that we run the files from the gz root directory.
  # We will simply copy the patch and bin directories to our N64_ROOT.
  install -d -m 755 $pkgdir/${_installdir}
  install -d -m 755 $pkgdir/${_installdir}/src/
  install -d -m 777 $pkgdir/${_installdir}/obj/

  cp -r $srcdir/gz/bin      $pkgdir/${_installdir}
  cp -r $srcdir/gz/patch    $pkgdir/${_installdir}
  cp -r $srcdir/gz/oot-*    $pkgdir/${_installdir}
  cp -r $srcdir/gz/makefile $pkgdir/${_installdir}
  cp -r $srcdir/gz/src/ldr  $pkgdir/${_installdir}/src/

  chmod -R 777 $pkgdir/${_installdir}/bin
  chmod -R 777 $pkgdir/${_installdir}/patch

  mkdir -p $pkgdir/usr/bin
  install $srcdir/make-rom $pkgdir/usr/bin
  install $srcdir/make-patch $pkgdir/usr/bin
  install $srcdir/patch $pkgdir/usr/bin/patch-gz
}
