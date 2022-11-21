# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=python38-wxpython
_pkgname=wxPython
pkgver=4.1.1
_wxver=3.2.0
_pkgver="${pkgver%.*}"
_post="${pkgver##*.}"
pkgrel=3
epoch=1
pkgdesc='Cross-platform GUI toolkit'
arch=('x86_64')
license=('custom:wxWindows')
url='https://www.wxpython.org'
depends=('wxwidgets-gtk3' 'python38-six')
optdepends=('python38-pypubsub: Alternative to the deprecated wx.lib.pubsub API')
makedepends=('mesa' 'glu' 'webkit2gtk' 'python38-requests' 'python38-setuptools' 'sip' 'doxygen' 'waf')
checkdepends=('xorg-server-xvfb' 'python38-pytest-forked' 'python38-numpy')
source=("https://files.pythonhosted.org/packages/source/w/wxPython/wxPython-$pkgver.tar.gz"
         https://github.com/wxWidgets/wxWidgets/releases/download/v$_wxver/wxWidgets-$_wxver.tar.bz2
         173d0796810bb65de9bdfdc6941d24a04628f6c2.patch
         192109386d58066b7c8ede5d1178a4b719c5f00c.patch
         sip-5.patch
         sip-6.patch
         wxwidgets-3.1.5.patch
         wxwidgets-3.1.6.patch
         wxwidgets-3.1.7.patch
         wxwidgets-3.2.patch)
sha512sums=('00924008b97bbecb824c3fffd46fc76a5a3115d9346eb95baccc6cca99c080aa80b586af42fece8a3b4d234f2d07ffa8b66b50a164c41cbd95abc9b139c32809'
            'e55e7c5ac7abcacf2ecff7c22e367db17ff5a077d3d5d2aa7589e8ba7cc6695cfa48c0f00bcfdffeda8dc4f974f97a857fb61b4b300a724f7687d710fbb23967'
            '5ef772cb14f619b14506de51f58b062729ff7f23f789970ba078ced040fa35ba88994c3331b471c78c8c6186d8c0e432cf7c346e26b0a71f9f08b39f03021adc'
            'a75b8ecf69013abe621d5e8f181beac914985e210b4f43a31f7129092d44dfe71539ab75355b32aa0d623125a2866349648f106107330827c2af135305539a1d'
            'f619d9b405299558b84646f457a3bddcfffbd0eb90d23f329e107ebb9e3b6e1c6550cbb7a6c775dd65a08d679abcc7b4a6353d5d78ab263213789998b7c24346'
            '25a260238ee91b920cce184af6a24cf534ef1eb6a0e1148e52279b0b4990cc34b3cd81ea49ba71e2a9f437891d438b16cc4037bc787e7b44187f8f356a3982b9'
            'b324821f3423c5c9d5f7ff055704f7b88a87fa77ade31dfa563b1b35b0ab858a28e9c32a9607cfabafeff1a46177f413665623b254b69d512d7bb4ebdb63089b'
            '289211f6d7060c1387b27167403665831d721b693ca03485ce7663794c684af7e59c93e65bc4cae9aa3fa539f565e687bbd7efbd63adfaa9fa3aaf83bbfb6ea0'
            '95dd41b6d11b8b89aa639e3f1b16610124b38b5a711c1d1a35c4588f2ee9650e5f534af439d57c77c1971c7e08738abc518eafe5b0b7eb608237b316d1884169'
            'b919a9b714c076c2e2746c3e011802a56de10f5182f48db1f5da62797b204abd12a19d179f5aad4ad15799686be7c718a8ad256f611c2d1d734a7220f0f21658')

prepare() {
  cd $_pkgname-$pkgver
  # Fix build with sip 6
  patch -p1 -i ../sip-5.patch
  patch -p1 -i ../sip-6.patch
  # Fix build with wxWidgets 3.2
  patch -p1 -i ../wxwidgets-3.1.5.patch
  patch -p1 -i ../wxwidgets-3.1.6.patch
  patch -p1 -i ../wxwidgets-3.1.7.patch
  patch -p1 -i ../wxwidgets-3.2.patch
  # Fix Python 3.10 issues
  patch -p1 -i ../173d0796810bb65de9bdfdc6941d24a04628f6c2.patch
  # Fix wxBitmapBundle
  patch -p1 -i ../192109386d58066b7c8ede5d1178a4b719c5f00c.patch
  rm -r ext/wxWidgets
  mv "$srcdir"/wxWidgets-$_wxver ext/wxWidgets
}

build() {
  cd $_pkgname-$pkgver

  rm -r sip/{cpp,gen}/* # Recreate sip files with current wxWidgets
  SIP=/usr/bin/sip DOXYGEN=/usr/bin/doxygen WAF=/usr/bin/waf \
  python3.8 build.py dox etg --nodoc sip build --use_syswx --release
}

check() {
  cd $_pkgname-$pkgver

  # there are segfaulting tests so --forked ensures we get sensible results
  PYTHONPATH=$PWD xvfb-run pytest --forked unittests || echo "==> WARNING: tests usually fail randomly"
}

package() {
  cd $_pkgname-$pkgver

  python3.8 build.py install --destdir="$pkgdir"

  install -Dm 644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
  find "$pkgdir/usr/lib" -type f | xargs chmod 644
}
