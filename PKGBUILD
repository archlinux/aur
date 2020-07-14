# Maintainer: David Runge <dvzrv@archlinux.org>

pkgbase=non-daw
pkgname=('non-mixer' 'non-timeline')
pkgver=1.2.0
pkgrel=4
pkgdesc="Non DAW"
arch=('x86_64')
url="https://non.tuxfamily.org/"
license=('GPL3')
groups=('non-daw' 'pro-audio')
makedepends=('jack' 'ladspa' 'liblo' 'liblrdf' 'libxpm' 'ntk' 'waf')
source=("$pkgbase-$pkgver.tar.gz::https://git.tuxfamily.org/non/non.git/snapshot/${pkgbase}-v${pkgver}.tar.gz"
        "non-timeline-1.2.0-install-script.patch::https://github.com/original-male/non/commit/ea6ff30ceadda31b613ad16f919bba8fc3e59af0.patch"
        "https://raw.githubusercontent.com/original-male/non/d958df0486c7397c243f5ac36bf4acbc461a1e50/tools.waf/ntk_fluid.py")
sha512sums=('0f6f93032a546ea85af5554249e8a88bce0808bf6c852ba922d9f570f82d09052d1242dd579d427b59234c3991b8d8d665d3920ffff3170dc7f8d30556bde005'
            'f58a0a0791c5bb246f56abfc452140cd17b00483f32c0de0c061f6071d5a25af6ca96f44ab143c4d6d5e350192f2488efe06692394805b1f7c2e45a695e14e02'
            '9f45474fa51a8c3eed672d633a77d968ddee6b841589764378f08386f711ae1a6801c795c19d8987f1af9a36b5a6bcdaab2230db5359004ad73e791dbac50bc4')
b2sums=('56ba171cb3f2ac83f80e1e292f312e74dd3dddffaecf9102b7c407473ac38619bd27f71982b8fd0e3689b86da5c964a42058f7ac350a0ed20cfbc77698e7fe91'
        'fa26db4601f2ae6ce02066986175ba4d24dbf576f7e2180b84e2454e042cf4c4597b291fd01c5c3ee5647914c1bd8164f1ba1854a08e36caaef62a92251b4293'
        'e3d892f15922e137b1559fa893920ac80955762da7c3f8685c0c1d50d975ba6fcdd86da906bc41776857d8b14d5c86d16c19a5f532e9783f4685eefc9e774be2')

prepare() {
  mv -v "${pkgbase}-v${pkgver}" "${pkgbase}-${pkgver}"
  (
    cd "${pkgbase}-${pkgver}"
    # fix broken installation of import-ardour-session:
    # https://github.com/original-male/non/issues/244
    patch -Np1 -i "../non-timeline-1.2.0-install-script.patch"
    # import-ardour-session is actually python3 compatible
    # https://github.com/original-male/non/issues/257
    sed -e 's/python2/python/' -i timeline/bin/import-ardour-session
    # let wscript find the custom waf module
    mkdir -pv tools
    # ntk_fluid.py is not published in 1.2.0:
    # https://github.com/original-male/non/issues/253
    ln -sv "${srcdir}/ntk_fluid.py" tools/
    touch __init__.py
    sed -e "s/load('ntk_fluid'/load('ntk_fluid', tooldir='tools'/g" \
        -i wscript
  )
  cp -av "${pkgbase}-${pkgver}" "${pkgname[0]}-${pkgver}"
  cp -av "${pkgbase}-${pkgver}" "${pkgname[1]}-${pkgver}"
}

build() {
  (
    cd "${pkgname[0]}-${pkgver}"
    waf configure --prefix=/usr --project=mixer
    waf build -vv
  )
  (
    cd "${pkgname[1]}-${pkgver}"
    waf configure --prefix=/usr --project=timeline
    waf build -vv
  )
}

package_non-mixer() {
  pkgdesc="A powerful, reliable and fast modular Digital Audio Mixer"
  depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'libjack.so' 'liblo.so'
  'liblrdf.so' 'libntk.so' 'libntk_images.so')
  cd "$pkgname-$pkgver"
  waf --destdir="${pkgdir}" install -vv
}

package_non-timeline() {
  pkgdesc="A powerful, reliable and fast modular Digital Audio Timeline arranger"
  depends=('cairo' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'libjack.so'
  'liblo.so' 'libntk.so' 'libntk_images.so' 'libsndfile')
  optdepends=('python: For import-ardour-session')
  cd "$pkgname-$pkgver"
  waf --destdir="${pkgdir}" install -vv
  # the wscript installs import-ardour-session to a wrong location:
  # https://github.com/original-male/non/issues/256
  mv -v "${pkgdir}/usr/bin/bin/import-ardour-session" "${pkgdir}/usr/bin/import-ardour-session"
  rmdir -v "${pkgdir}/usr/bin/bin"
}
