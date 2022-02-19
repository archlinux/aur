# Maintainer: Que Quotion <quequotion@mailinator.com>
# Contributor: Xiao-Long Chen <chenxiaolongcxl.epac.to>

pkgname=indicator-powersave
pkgver=r102.10
pkgrel=1
pkgdesc="User discretion power managment utility forked from CPU frequency indicator"
arch=('i686' 'x86_64')
url="https://launchpad.net/indicator-cpufreq"
license=('GPL')
depends=('libappindicator-gtk3' python2{,-{dbus,gobject}} 'pygtk' 'polkit-gnome' 'indicator-application' 'throttlectl')
makedepends=('python2-distutils-extra' 'bzr')
provides=(indicator-cpufreq{,-bzr})
conflicts=(indicator-cpufreq{,-bzr})
source=("bzr+lp:indicator-cpufreq"
        'indicator-cpufreq.rules'
        'com.ubuntu.indicator.policy.in.patch'
        'indicator-cpufreq-selector.patch'
        'indicator.py.patch'
        'no-cpufreq.patch')
sha512sums=('SKIP'
            '5427f1dcd51fe7fb43bbce1bc020a32312e2f82ccf643129b9887262730989197e2ce2cd4494922df058e78bdb8fbe220eccd69588ff917a891d5a56b3366a24'
            '9b57d18ef9edc6b609b24f6a62c93c472bc2b72dd158728af1a1d0833a308a72457b0ad32c2d51b357650fa69c0f7f595fa55901ea490a7a3fda3c7c998de2bd'
            '52e053f6f1a972cd5d04224358de64e1569f7cd9cd1b845e933f4e4467936d6457bd68d3373b6e2d482578ed3fca2b33b1c7ee9a843f992ff2bb4b8da3139631'
            '1b8b56a841e736d5531632a1c4c229508e1c8a5c840cd2d172e2d89e7aa3a00d549bcd941b209692f8e09bff3739f28f971a1028d3acd4c37cc9176b9425e2a1'
            '2b1229ad56651a8d55590256785119da4eba2a2f8d74e57475a8303dc076d5e9067a6481e3245d05557ea0f983d8fa1f1ac02f705fe695f4a4ef79fa86b00b89')

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
}
