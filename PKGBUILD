# Maintainer: Que Quotion <quequotion@mailinator.com>
# Contributor: Xiao-Long Chen <chenxiaolongcxl.epac.to>

pkgname=indicator-powersave
pkgver=r98.9
pkgrel=1
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
            '1b8b56a841e736d5531632a1c4c229508e1c8a5c840cd2d172e2d89e7aa3a00d549bcd941b209692f8e09bff3739f28f971a1028d3acd4c37cc9176b9425e2a1'
            '2b1229ad56651a8d55590256785119da4eba2a2f8d74e57475a8303dc076d5e9067a6481e3245d05557ea0f983d8fa1f1ac02f705fe695f4a4ef79fa86b00b89'
            'f0e49ab4e4eb4345cdefdf01ae75b9ed753c2d6f2d29d15ffb5b2826cba0e02add27c2d5f41ed45779aeabcf927a104f25b1d5d462574140d24d830ff3a1f5c9'
            '0b2de8aa79a837e399684164b29992ae0ab8a2c07412fe837c920e8d3905620ac98d700ee9ee0e8328d398e1d64aea3b01962f0ba573f9a8ff5a41fea5628ace')

pkgver() {
  cd indicator-cpufreq

  printf "r%s" "$(bzr revno).9"
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
