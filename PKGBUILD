# Maintainer: GI_Jack <GI_Jack@hackermail.com>
pkgname=datasploit
pkgver=1.0a
pkgrel=2
pkgdesc="An OSINT framework to perform various recon techniques on Companies, People, Phone Number, Bitcoin Addresses, etc"
arch=('any')
url="http://datasploit.info/"
license=('GPLv3')
depends=('python2' 'python-setuptools' 'python2-billiard' 'python2-beautifulsoup4'
	'python2-beautifulsoup3' 'python2-config' 'python2-configobj' 'python2-tld'
	'python2-dnspython' 'python2-future' 'python2-google-api-python-client'
	'python2-html5lib' 'python2-idna' 'python2-pymongo' 'python2-praw'
	'python2-wappalyzer' 'python2-whois' 'python2-pytz' 'python2-requests'
	'python2-requests-file' 'python2-simplejson' 'python2-termcolor'
	'python2-tqdm' 'python2-tweepy' 'python2-netaddr' 'python2-clearbit'
	'python2-lxml' 'python2-ipwhois' 'python2-json2html' 'python2-travispy'
	'python2-piplapis' 'python2-anyjson' 'python2-tldextract' 'python2-cfscrape')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GIJack/datasploit/archive/v${pkgver}.tar.gz")
sha256sums=('3c9e380ca69d0c9d4e1f1234a635929a558b491293b8b69713c575d5d5e6c392')

build() {
  cd "${pkgname}-${pkgver}"

  # make "front end"
  cat > datasploit.sh << EOF
cd /usr/share/datasploit
./datasploit.py "\${@}"
EOF

  # precompile and cache everything:
  for dir in domain emails ip username;do
    cd ${dir}
    python2 -m compileall *
    cd ..
  done
}

package() {
  cd "${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/datasploit/"
  cp -r * "${pkgdir}/usr/share/datasploit/"
  install -Dm755 datasploit.sh "${pkgdir}/usr/bin/datasploit"
  install -Dm644 config_sample.py "${pkgdir}/etc/datasploit/config.py"
}

