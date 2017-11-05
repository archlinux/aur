# Maintainer: Yunhui Fu <yhfudev@gmail.com>

pkgbase=hustoj-git
pkgname=hustoj-git

# Dirty hack as AUR dont support split-packages
true && pkgname=('hustoj-judge-git' 'hustoj-web-git')

pkgver=r3120.58b04b80
pkgrel=1
pkgdesc='HUST Online Judge'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'arm')
url='https://github.com/zhblue/hustoj.git'
license=('GPL')
makedepends=('git' 'libmariadbclient')
options=('emptydirs')
install="hustoj.install"
source=(
    #"${pkgbase}-${pkgver}.tar.gz::https://github.com/zhblue/hustoj/archive/${pkgver}.tar.gz"
    "${pkgbase}::git+https://github.com/zhblue/hustoj.git"
    "hustoj.install"
    "sethustoj.sh"
    )
sha256sums=('SKIP'
            '4fdf2875aa03b98ecc0a6e732159653542930b5f26b1877388faa96ee83b0435'
            '6cfe333bc5fed6f9c8e64c72dffb852c54b5142d01278c00d1eda51927b1291f'
    )

pkgver_git() {
    cd "${srcdir}/${pkgbase}"
    #local ver="$(git show | grep commit | awk '{print $2}' )"
    #printf "r%s" "${ver//[[:alpha:]]}"
    #echo ${ver:0:7}
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

pkgver() {
    pkgver_git
}

prepare() {
  cd "${srcdir}/${pkgbase}"
  msg "git fetch --all"
  git remote set-url origin ${url}
  git fetch --all

  case $CARCH in
  i686|x86_64)
    git checkout remotes/origin/master
    ;;
  armv6h|armv7h|arm)
    git checkout remotes/origin/rpi
    ;;
  esac
}

build() {
    cd "${srcdir}/${pkgbase}"
    cd trunk/core/judged
    make
    cd ../judge_client
    make
    cd ../sim/sim_2_77
    #make fresh
    make exes
}

package_hustoj-judge-git() {
  pkgdesc="HUST Online Judge binaries"
  conflicts=('hustoj-judge')
  provides=("hustoj-judge")

  msg 'Preparing package ...'

  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share"

  cp -r "${pkgbase}/trunk/install/" "$pkgdir/usr/share/hustoj"

  cd "${srcdir}/${pkgbase}"
  cd trunk/core/judged
  cp judged $pkgdir/usr/bin
  chmod +x $pkgdir/usr/bin/judged
  cd ../judge_client
  cp judge_client $pkgdir/usr/bin
  chmod +x $pkgdir/usr/bin/judge_client
  cd ../sim/sim_2_77
  cp sim_c.exe $pkgdir/usr/bin/sim_c
  cp sim_java.exe $pkgdir/usr/bin/sim_java
  cp sim_pasc.exe $pkgdir/usr/bin/sim_pas
  cp sim_text.exe $pkgdir/usr/bin/sim_text
  cp sim_lisp.exe $pkgdir/usr/bin/sim_scm
  chmod +x $pkgdir/usr/bin/sim*
  cd ..
  cp sim.sh $pkgdir/usr/bin
  chmod +x $pkgdir/usr/bin/sim.sh
  rm -f $pkgdir/usr/bin/sim_cc $pkgdir/usr/bin/sim_rb $pkgdir/usr/bin/sim_sh
  ln -s sim_c $pkgdir/usr/bin/sim_cc

  cp ${srcdir}/sethustoj.sh "$pkgdir/usr/share/hustoj/"
}

package_hustoj-web-git() {
  pkgdesc="HUST Online Judge web UI"
  conflicts=('hustoj-web')
  provides=("hustoj-web")
  arch=('any')

  install=hustoj.install

  depends=('php' 'php-fpm' 'php-gd')
  optdepends=('nginx: Web server for serving Wordpress'
            'apache: Web server for serving Wordpress'
            'mariadb: Database server')

  msg 'Preparing package ...'

  install -d "$pkgdir/usr/share"
  install -d "$pkgdir/usr/share/webapps"

  cp -r "${pkgbase}/trunk/web/" "$pkgdir/usr/share/webapps/hustoj"
  chown http:http -R "$pkgdir/usr/share/webapps/hustoj"
}

# vim: ts=2 sw=2 et:

