# Maintainer: Que Quotion <quequotion@mailinator.com>
# Contributor: Xiao-Long Chen <chenxiaolongcxl.epac.to>

pkgname=indicator-powersave
pkgver=r98
pkgrel=6
pkgdesc="User discretion power managment utility forked from CPU frequency indicator (bzr version)"
arch=('i686' 'x86_64')
url="https://launchpad.net/indicator-cpufreq"
license=('GPL')
depends=('cpupower' 'libappindicator3' 'python2' 'python2-dbus' 'python2-gobject' 'pygtk' 'polkit-gnome' 'indicator-application')
optdepends=('x86_energy_perf_policy' 'hdparm' 'nvidia-utils' 'iw' 'ethtool')
makedepends=('python2-distutils-extra')
provides=('indicator-cpufreq' 'indicator-cpufreq-bzr')
conflicts=('indicator-cpufreq' 'indicator-cpufreq-bzr')
source=("bzr+lp:indicator-cpufreq"
        'indicator-cpufreq.rules'
        '0001_Use_cpupower.patch'
        'indicator-powersave.patch'
        'cpu-online.patch'
        'schedutil.patch'
        'use-sysfs.patch'
        'throttle'
        'throttle-cut.service')
sha512sums=('SKIP'
            '5427f1dcd51fe7fb43bbce1bc020a32312e2f82ccf643129b9887262730989197e2ce2cd4494922df058e78bdb8fbe220eccd69588ff917a891d5a56b3366a24'
            '8aad00c00a95d71f221647263422eef89a0207bdb55d883520f3871f28551c316860560207c96144e22dda2ab5f5fc9b8c7bfa0fc642283de160bfd61458b8c0'
            'd9ea712c0a0d6da9dc291b75322a207d83f73bd2a6e92111167679e53469cf3608e56ca40437bdc4a584d519d07e799292905d33d4dca65fff35bc7b0987b0a5'
            '8e929aa5d00a17be32b33085eb09aa66002a48696651adcd99678663230d73ed215b88634bb6364867140b8a336566cd02e0b04927423980ca4be9833f316b2a'
            '56f87addd1d2479446bfed262f4e95b5494fd958c6138dc68c03071b74dacba24c40e7cd946233816fde963e3bcbaf5cab4b1cf19288dfb8058ee9ff424ca367'
            'b39f5bf06ce8c65f315582e92db34649f5967936ba2e5b27b61532314dc5e39cd6172f7e2da701e5f1de962e29021d041a770384a91267d819daa35fc8d45384'
            '99983956adefafd45292c86616ab847e9221745dff47120b0a28f00002c46ed1e5abd270a7320088513db10a7f647ebf6d5a3423de5aa9af95ee7fe819c21c14'
            'aa86b5d6028033d6fbcc3d74d63c33298c0d437972d576990dfc4cae51d5c5128d789695e98fc5612ec7f8a4e2e68ea0576cf072e98fce4e0c22896be2f8b996')

pkgver() {
  cd indicator-cpufreq

  printf "r%s" "$(bzr revno)"
}

prepare() {
  cd "${srcdir}/indicator-cpufreq"

  #Indicator-Powersave
  patch -Np1 -i "${srcdir}/indicator-powersave.patch"

  #Fixes
  patch -Np1 < "${srcdir}/0001_Use_cpupower.patch"
  patch -Np2 < "${srcdir}/cpu-online.patch"
  patch -Np2 < "${srcdir}/schedutil.patch"
  patch -Np2 < "${srcdir}/use-sysfs.patch"
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
