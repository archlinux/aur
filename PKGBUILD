# Maintainer: Ethan Skinner <aur@etskinner.com>
# Contributor: Grégoire Seux <grego_aur@familleseux.net>
# Contributor: Dean Galvin <deangalvin3@gmail.com>
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>

pkgname=home-assistant
pkgdesc='Open-source home automation platform running on Python 3'
pkgver=0.79.3
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
         'python-astral>=1.6.1'
         'python-async-timeout>=3.0.0'
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
         'python-requests>=2.19.1'
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
sha512sums=('06e8b4833d4859684be54705044b8834afe1b28c75a1414cb30ad0f8da082de60efa4b71de5abc1018d074c8ef4dd1c6d26177405efad6b0d013bba5c21e4339'
            'fe96bd3df3ba666fd9f127c466d1dd1dd7314db2e57826a2b319c8a0bfad7aedeac398e748f93c6ecd9c2247ebbae196b8b0e7263b8681e2b7aeab6a8bfeab80'
            '100665ac35370c3ccec65d73521568de21cebf9e46af364124778861c94e338e32ad9abb675d3917f97d351dd7867e3ab2e80c26616330ae7cf0d9dc3f13369b'
            '8babcf544c97ec5ad785014f0b0d5dca556a2f5157dadcbe83d49d4669b74f6349e274810ec9a028fcec208c6c8fbbe6b3899d2933b56163b9e506570879a3ad'
            '65edbf1e544322deb6b5b8e1197e54c5cb8b25e3dad7b4b882ca4d41d3240b3f049c2e928f083e261d14aa5e54ca0b228f128796a07f151cd01cc867acfdb305')
#validpgpkeys=('') # TODO https://github.com/home-assistant/home-assistant/issues/9487
install='hass.install'

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
