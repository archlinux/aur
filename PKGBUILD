# Maintainer: Que Quotion <quequotion@mailinator.com>
# Contributor: Xiao-Long Chen <chenxiaolongcxl.epac.to>

pkgname=indicator-powersave
pkgver=r98.8
pkgrel=3
pkgdesc="User discretion power managment utility forked from CPU frequency indicator (bzr version)"
arch=('i686' 'x86_64')
url="https://launchpad.net/indicator-cpufreq"
license=('GPL')
depends=('libappindicator3' 'python2' 'python2-dbus' 'python2-gobject' 'pygtk' 'polkit-gnome' 'indicator-application')
optdepends=('x86_energy_perf_policy' 'hdparm' 'nvidia-utils' 'iw' 'ethtool')
makedepends=('python2-distutils-extra')
provides=('indicator-cpufreq' 'indicator-cpufreq-bzr')
conflicts=('indicator-cpufreq' 'indicator-cpufreq-bzr')
source=("bzr+lp:indicator-cpufreq"
        'indicator-cpufreq.rules'
        'com.ubuntu.indicator.policy.in.patch'
        'indicator-cpufreq-selector.patch'
        'indicator.py.patch'
        'no-cpufreq.patch'
        'throttle'
        'throttle-cut.service')
sha512sums=('SKIP'
            '5427f1dcd51fe7fb43bbce1bc020a32312e2f82ccf643129b9887262730989197e2ce2cd4494922df058e78bdb8fbe220eccd69588ff917a891d5a56b3366a24'
            '9b57d18ef9edc6b609b24f6a62c93c472bc2b72dd158728af1a1d0833a308a72457b0ad32c2d51b357650fa69c0f7f595fa55901ea490a7a3fda3c7c998de2bd'
            '7e30098e35a72d66a885290a2be2aaf86b72f0242fd4d7ed62e81f9f6e7da378d70c7f7ef54701374dd1440f64173330457cdaf58a3a9bca35a59a57b29123a7'
            'a0da38fbc7e28189bdb95992880cba5a8b4882a02cac00c13415b5a59c1dc63152965fc221069aafbd39e1e12bd93e3b7d028f50ebd215223e9ace3ee2f8642d'
            '2b1229ad56651a8d55590256785119da4eba2a2f8d74e57475a8303dc076d5e9067a6481e3245d05557ea0f983d8fa1f1ac02f705fe695f4a4ef79fa86b00b89'
            'd8f8b79e87a812294012e2f69939ecaa0f5e2cf5e193b80f1d9c2330a26c7527067c736aa1756990a6ee79d803158b078362a561dc7dc75a8d6a500d3224859d'
            'ba1be41c730b92e6f1e7d9b29b049d11bb76955fb52517ac712ec5ba889fcf9b5ebf3be2415f8ff7b14cb689fecc06e88bf6ccc6eb4f28708228aaf5c6967f35')

pkgver() {
  cd indicator-cpufreq

  printf "r%s" "$(bzr revno).8"
}

prepare() {
  cd "${srcdir}/indicator-cpufreq"

  #Indicator-Powersave
  patch -Np0 < "${srcdir}/com.ubuntu.indicator.policy.in.patch"
  patch -Np0 < "${srcdir}/indicator-cpufreq-selector.patch"
  patch -Np0 < "${srcdir}/indicator.py.patch"
  patch -Np0 < "${srcdir}/no-cpufreq.patch"

}

package() {
  cd "${srcdir}/indicator-cpufreq"
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -dm750 -o polkitd "${pkgdir}/usr/share/polkit-1/rules.d/"
  install -m644 "${srcdir}/indicator-cpufreq.rules" \
    "${pkgdir}/usr/share/polkit-1/rules.d/"

  # Don't install throttle script if user has a personalized copy
  if [ ! -f "/usr/local/sbin/throttle" ]; then
    install -Dm755 "${srcdir}/throttle" "${pkgdir}/usr/bin/throttle"
  fi
  install -Dm644 "${srcdir}/throttle-cut.service" "${pkgdir}/etc/systemd/system/throttle-cut.service"
}
