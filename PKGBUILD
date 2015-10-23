# Maintainer: Que Quotion <quequotion@mailinator.com>
# Contributor: Xiao-Long Chen <chenxiaolongcxl.epac.to>

pkgname=indicator-powersave
pkgver=r98
pkgrel=1
pkgdesc="User discretion power managment utility forked from CPU frequency indicator (bzr version)"
arch=('i686' 'x86_64')
url="https://launchpad.net/indicator-cpufreq"
license=('GPL')
depends=('cpupower' 'libappindicator3' 'python2' 'python2-dbus' 'python2-gobject' 'pygtk' 'polkit-gnome' 'indicator-application')
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
            '5427f1dcd51fe7fb43bbce1bc020a32312e2f82ccf643129b9887262730989197e2ce2cd4494922df058e78bdb8fbe220eccd69588ff917a891d5a56b3366a24'
            '8aad00c00a95d71f221647263422eef89a0207bdb55d883520f3871f28551c316860560207c96144e22dda2ab5f5fc9b8c7bfa0fc642283de160bfd61458b8c0'
            'de7f3471d842700811869ff388906218ec19fb85b7fd2faecff2eb9b341c5c5acbdfdc246e67b556c2d45eafbe25ca13d860dc09825c913a11b49532d6982ee5'
            '043a31b0c0b9fa19bbc0a8b23aa507888487028caebd5f887b40f22026542b82d8649d876824b1a5f845dcbf386239eda7965243d5d7f5997d636b6cf15d469c'
            'aa86b5d6028033d6fbcc3d74d63c33298c0d437972d576990dfc4cae51d5c5128d789695e98fc5612ec7f8a4e2e68ea0576cf072e98fce4e0c22896be2f8b996')

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
