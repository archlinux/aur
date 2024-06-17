# Maintainer: Giorgi Taba K'obakhidze <t@gtk.ge>

pkgname=messlidger
_name=$pkgname
_pkgver='0.0.0.dev0+20240516.gite91c2b67e7' # Only change this
pkgver=0.0.0.dev0+20240516.gite91c2b67e7.py3.12
pkgrel=1
pkgdesc='A feature-rich Facebook Messenger to XMPP puppeteering gateway, based on slidge and mautrix-facebook.'
arch=('any')
url="https://git.sr.ht/~nicoco/messlidger"
license=('AGPL3')
depends=('python' 'python-slidge' 'mautrix-facebook-git')
makedepends=('python-wheel' 'python-installer')
backup=('etc/slidge/messlidger.conf')
source=("https://slidge.im/repo/$_name/${_name//-/_}-$_pkgver.tar.gz"
        'messlidger.tmpfile.d'
        'messlidger.sysuser.conf'
        'messlidger.service'
        'messlidger.conf')
sha256sums=('e405e9981d43adbda1a8265eeecdb83dee606894d91e738e43c990627926f76a'
            'e2216061d8a45bd6d194730eaab94fa7a98948bbd5ce7834c7c33dc281db85e7'
            '5f411731658c6f05448dd61123d5831389ebcc2107d5277458f68ac7d40ee0da'
            '4d7d6e6fe6a37680cdb68bdf481c9b803c7c93bebf84bd5ed6056af8625a8b40'
            '0e595a80a4301ef94509540477148e7d7a1ce5b9cce80a1f1c1399cd098c277e')

pkgver() {
  python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  printf %s\\n "$_pkgver.py$python_version"
}

build() {
  cd "$srcdir/${_name//-/_}-$_pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"
  install -Dm 644 -t "$pkgdir"/usr/lib/systemd/system/ messlidger.service
  install -Dm 644 messlidger.sysuser.conf "${pkgdir}"/usr/lib/sysusers.d/messlidger.conf
  install -Dm 644 messlidger.tmpfile.d "${pkgdir}"/usr/lib/tmpfiles.d/messlidger.conf
  install -m 755 -d "$pkgdir/etc/slidge/"
  install -m 640 -t "$pkgdir/etc/slidge/" messlidger.conf

  cd -- "${_name//-/_}-$_pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
