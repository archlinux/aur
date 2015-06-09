# Contributor: Jakub Vitak <mainiak@gmail.com>
pkgname=indefero-git
pkgver=20091115
pkgrel=3
pkgdesc="Bug tracking, code review and free software forge"
arch=('i686' 'x86_64')
url="http://www.indefero.net"
license=('GPL')
groups=()
depends=('pluf')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=(!purge)
install=
source=('_htaccess' 'git.crontab' 'path.php' 'papp.php')
noextract=()

_gitroot="git://projects.ceondo.com/indefero.git"
_gitname="indefero"

_FQDN="your-domain"
_git_user="git"
_http_user="http"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf $pkgdir
  mkdir -p $pkgdir/srv/http
  cp -r $srcdir/$_gitname $pkgdir/srv/http
  rm -rf $pkgdir/srv/http/$_gitname/.git
  find $pkgdir -type f -name ".gitignore" -exec rm -f {} \;

  cp $srcdir/_htaccess $pkgdir/srv/http/$_gitname/www/.htaccess
  #crontab git.crontab -u $_git_user
  #crontab - -u $_git_user < git.crontab

  cd $pkgdir/srv/http/$_gitname/src/IDF
  install -m644 $srcdir/papp.php ./

  cd conf
  install -m644 $srcdir/path.php ./

} 
md5sums=('a9f992911798a18b94ac0d8eb4d990f8'
         '8385e1a7ede6321c29643e54483f82aa'
         '7a9212b9509f4ad7678ade42c3280283'
         '4daff5fd70c18e761a4a3a7040405f37')
