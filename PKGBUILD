# Maintainer: Ethan Skinner <aur@etskinner.com>
# Contributor: Grégoire Seux <grego_aur@familleseux.net>
# Contributor: Dean Galvin <deangalvin3@gmail.com>
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>

pkgname=home-assistant
pkgdesc='Open-source home automation platform running on Python 3'
pkgver=0.84.2
pkgrel=1
url="https://home-assistant.io/"
license=('APACHE')
arch=('any')
replaces=('python-home-assistant')
makedepends=('python-setuptools')
# NB: this package will install additional python packages in /var/lib/hass/lib depending on components present in the configuration files.
depends=('python'
         'python-aiohttp>=3.4.4'
         'python-aiohttp-cors>=0.5.3'
         'python-astral>=1.7.1'
         'python-async-timeout>=3.0.1'
         'python-attrs>=18.2.0'
         'python-bcrypt>=3.1.4'
         'python-certifi>=2018.04.16'
         'python-chardet>=3.0.4'
         'python-cryptography>=2.3.1'
         'python-distro>=1.3.0'
         'python-jinja>=2.10'
         'python-pyjwt>=1.6.4'
         'python-netifaces'
         'python-pip>=8.0.3'
         'python-pytz>=2018.04'
         'python-requests>=2.20.1'
	 'python-ruamel-yaml>=0.15.80'
         'python-sqlalchemy>=1.2.11'
         'python-vincenty'
         'python-voluptuous>=0.11.5'
         'python-voluptuous-serialize>=2.0.0'
         'python-webcolors'
         'python-yaml'
         'python-yarl'
         )
optdepends=('git: install component requirements from github'
            'net-tools: necessary for nmap discovery')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/${pkgver}.tar.gz"
        "home-assistant.service"
        "home-assistant.sysusers"
        "home-assistant-tmpfile.conf"
        "hass.install")
sha512sums=('88fcf37c4bd8343e2f7dec061ebf2a6c53068b54e3404f4d99206f761020447ec25b6d6a9130a823ccba0fd2d257befcdd12134b50049bebc0da4ba31e9b5c9e'
            'fe96bd3df3ba666fd9f127c466d1dd1dd7314db2e57826a2b319c8a0bfad7aedeac398e748f93c6ecd9c2247ebbae196b8b0e7263b8681e2b7aeab6a8bfeab80'
            '100665ac35370c3ccec65d73521568de21cebf9e46af364124778861c94e338e32ad9abb675d3917f97d351dd7867e3ab2e80c26616330ae7cf0d9dc3f13369b'
            '3e93118c84954f829767dc71ce534c5d02c1c95fc8748714c7a2df28a3a297f59962f8fb7cddf721987eb97d62feabb25acda5d38209e365646ca4a4ef4356e3'
            '65edbf1e544322deb6b5b8e1197e54c5cb8b25e3dad7b4b882ca4d41d3240b3f049c2e928f083e261d14aa5e54ca0b228f128796a07f151cd01cc867acfdb305')
#validpgpkeys=('') # TODO https://github.com/home-assistant/home-assistant/issues/9487
install=hass.install

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # TODO remove in future versions https://github.com/home-assistant/home-assistant/issues/9525
  replace '==' '>=' setup.py
  
  echo Patching for home-assistant/home-assistant#11906
  sed -i 's/from yarl import unquote/from yarl import URL/' homeassistant/components/http/static.py
  sed -i "s/unquote(request.match_info\['filename'\])/URL(request.match_info['filename'], encoded=True).path/" homeassistant/components/http/static.py
}

replace() {
  pattern=$1
  substitute=$2
  file=$3
  echo -n "Replacing '$pattern' by '$substitute' in $file..."
  if grep -q $pattern $file && sed -i "s/$pattern/$substitute/" $file; then
    echo "DONE"
  else
    echo "FAILED"
    depname=$(echo $pattern | sed 's/[>=<].*$//')
    echo Current line in $file:
    grep $depname $file
    exit 1
  fi
}

package() {
  install -Dm644 home-assistant.service "${pkgdir}/usr/lib/systemd/system/home-assistant.service"
  install -Dm644 home-assistant.sysusers "${pkgdir}/usr/lib/sysusers.d/hass.conf"
  install -Dm644 home-assistant-tmpfile.conf "${pkgdir}/usr/lib/tmpfiles.d/hass.conf"

  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
}
