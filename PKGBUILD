# Maintainer: Que Quotion <quequotion@mailinator.com>
# Contributor: Xiao-Long Chen <chenxiaolongcxl.epac.to>

pkgname=indicator-powersave
pkgver=r97
pkgrel=3
pkgdesc="User discretion power managment utility forked from CPU frequency indicator (bzr version)"
arch=('i686' 'x86_64')
url="https://launchpad.net/indicator-cpufreq"
license=('GPL')
depends=('cpupower' 'libappindicator3' 'python2' 'python2-dbus' 'python2-gobject' 'pygtk' 'polkit-gnome')
makedepends=('python2-distutils-extra')
provides=('indicator-cpufreq' 'indicator-cpufreq-bzr')
conflicts=('indicator-cpufreq' 'indicator-cpufreq-bzr')
source=("bzr+lp:indicator-cpufreq"
        'indicator-cpufreq.rules'
        '0001_Use_cpupower.patch'
        'indicator-powersave.patch'
        'throttle'
        'throttle-cut.service')
sha512sums=('SKIP'
            '99bf1e503baf936cd621c282d468903220e3e445a399a72f66d035dc4ad960d63d311ec9a52fabcd94116bc406b7a77e4414f1b5166d0c92af164b2d939ee940'
            '8aad00c00a95d71f221647263422eef89a0207bdb55d883520f3871f28551c316860560207c96144e22dda2ab5f5fc9b8c7bfa0fc642283de160bfd61458b8c0'
            '66cb9af6cbd6ab477851e59eb971e21afc7acaba9668dfb77d055ff1f80822e489a1a0f4ae96a7404a89701da03972af43e8b34f72269d9ce8211c61d2cf487a'
            '29b20b6312e1a3afbf955be11d51b3a3ef096cecb265f34e05c56a145a518285c464c99a812293eea7a3fe30a5344837dec2efddad9f1ef7953480645dca9168'
            'd94cac93cb8593c59f4e7d4eb5bb2991bc0484f47e430645bcea989d1b89aaf9669470d2bcd36beabaf3822526d8902f43648f6a021fa10c56cf1adaedecfced')

pkgver() {
  cd indicator-cpufreq

  printf "r%s" "$(bzr revno)"
}

prepare() {
  cd "${srcdir}/indicator-cpufreq"

  patch -Np1 -i "${srcdir}/0001_Use_cpupower.patch"
  patch -Np1 -i "${srcdir}/indicator-powersave.patch"
}

package() {
  cd "${srcdir}/indicator-cpufreq"
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -dm700 -o polkitd "${pkgdir}/usr/share/polkit-1/rules.d/"
  install -m644 "${srcdir}/indicator-cpufreq.rules" \
    "${pkgdir}/usr/share/polkit-1/rules.d/"

  # Don't install throttle script if user has a personalized copy
  if [ ! -f "/usr/local/sbin/throttle" ]; then
    install -Dm755 "${srcdir}/throttle" "${pkgdir}/usr/bin/throttle"
  fi
  install -Dm644 "${srcdir}/throttle-cut.service" "${pkgdir}/etc/systemd/system/throttle-cut.service"
}
