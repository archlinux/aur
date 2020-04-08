# Maintainer: Que Quotion <quequotion@mailinator.com>
# Contributor: Xiao-Long Chen <chenxiaolongcxl.epac.to>

pkgname=indicator-powersave
pkgver=r98.10
pkgrel=2
pkgdesc="User discretion power managment utility forked from CPU frequency indicator (bzr version)"
arch=('i686' 'x86_64')
url="https://launchpad.net/indicator-cpufreq"
license=('GPL')
depends=('libappindicator-gtk3' 'python2' 'python2-dbus' 'python2-gobject' 'pygtk' 'polkit-gnome' 'indicator-application')
optdepends=('x86_energy_perf_policy' 'hdparm' 'nvidia-utils' 'iw' 'ethtool')
makedepends=('python2-distutils-extra' 'bzr')
provides=('indicator-cpufreq' 'indicator-cpufreq-bzr')
conflicts=('indicator-cpufreq' 'indicator-cpufreq-bzr')
backup=(etc/throttle.d/{powersave,performance})
source=("bzr+lp:indicator-cpufreq"
        'indicator-cpufreq.rules'
        'com.ubuntu.indicator.policy.in.patch'
        'indicator-cpufreq-selector.patch'
        'indicator.py.patch'
        'no-cpufreq.patch'
        'throttle'
        'throttle-cut.service'
        'powersave'
        'performance')
sha512sums=('SKIP'
            '5427f1dcd51fe7fb43bbce1bc020a32312e2f82ccf643129b9887262730989197e2ce2cd4494922df058e78bdb8fbe220eccd69588ff917a891d5a56b3366a24'
            '9b57d18ef9edc6b609b24f6a62c93c472bc2b72dd158728af1a1d0833a308a72457b0ad32c2d51b357650fa69c0f7f595fa55901ea490a7a3fda3c7c998de2bd'
            '7e30098e35a72d66a885290a2be2aaf86b72f0242fd4d7ed62e81f9f6e7da378d70c7f7ef54701374dd1440f64173330457cdaf58a3a9bca35a59a57b29123a7'
            '1b8b56a841e736d5531632a1c4c229508e1c8a5c840cd2d172e2d89e7aa3a00d549bcd941b209692f8e09bff3739f28f971a1028d3acd4c37cc9176b9425e2a1'
            '2b1229ad56651a8d55590256785119da4eba2a2f8d74e57475a8303dc076d5e9067a6481e3245d05557ea0f983d8fa1f1ac02f705fe695f4a4ef79fa86b00b89'
            '48fac136a0ff11bec6c7c5fc840f81dc2f04dea5fe1132b4af735940e1360cc320f6a59cac573a356bf7ab25166bbc2da6fb9faf981644196d277824a2219337'
            '0b2de8aa79a837e399684164b29992ae0ab8a2c07412fe837c920e8d3905620ac98d700ee9ee0e8328d398e1d64aea3b01962f0ba573f9a8ff5a41fea5628ace'
            '3d487961bf86254817fd099b888d6245bbf1e57622166dc8df378d639bfb1c0fc105646038be6093183be102294394b88cde382fe961f7606b68619af4a00595'
            'd11ed5f4344f07507497e816ccd7612ffc6df70636ca5f4817a9ce6e3b190b3a17fb02c44c4bf648359f640e4c63cc0b0134968ff4d3d989ad05fa4c095b03d3')

pkgver() {
  cd indicator-cpufreq

  printf "r%s" "$(bzr revno).10"
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

  install -Dm755 "${srcdir}/throttle" "${pkgdir}/usr/bin/throttle"
  install -Dm755 "${srcdir}/powersave" "${pkgdir}/etc/throttle.d/powersave"
  install -Dm755 "${srcdir}/performance" "${pkgdir}/etc/throttle.d/performance"

  install -Dm644 "${srcdir}/throttle-cut.service" "${pkgdir}/etc/systemd/system/throttle-cut.service"
}
