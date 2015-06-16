# Maintainer: Cravix < dr dot neemous at gmail dot com >

pkgname=limnoria-python3-git
_pkgname=Limnoria
pkgver=0.83.4.1.10347.530c246
pkgrel=1
pkgdesc="An IRC bot based on Supybot, with sqlite3 support and other features (unstable version)"
arch=('any')
url="https://github.com/ProgVal/Limnoria"
license=('3-clause BSD')
depends=('python')
makedepends=('git')
optdepends=("python-charade: Detect page's encoding"
            "python-pytz: Enable Time plugin to calculate the time in specified timezone"
            "python-dateutil: Enable Time plugin to parse the input time string"
            "python-gnupg: GnuPG support"
            "python-feedparser: RSS plugin support"
            #"python-sqlalchemy: Alternative DB engine when no SQLite3 engine installed" 
            # But SQLite module has already been integrated into python package, so it doesn't matter
            #"python-mock: For testing only"
            "python-ecdsa: ECDSA support")
source=("git://github.com/ProgVal/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  echo $(awk -F"['+]" '/% version/ {print $2}' ./setup.py).$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname"
  
  #rename "supybot" "supybot3" ./man/* ./scripts/*
  #sed -i '/man1/s/supybot/supybot3/; s/\(scripts\/supybot\)/\13/' setup.py
  python3 setup.py build
}

package() {
  cd "$srcdir/$_pkgname"

  python3 setup.py install --root="$pkgdir" || return 1
  
  cd "$pkgdir/usr"
  rename "supybot" "supybot3" ./share/man/man1/* ./bin/*
}
