# Maintainer: seiuneko <chfsefefgesfen foxmail>

_pkgname=qiandao
pkgname=${_pkgname}-git
pkgver=20250803.r15.g72a260d
pkgrel=1
pkgdesc='一个自动签到框架 base on an HAR editor。基于 binux/qiandao 进行修改，添加完善功能。'
arch=('any')
url='https://github.com/qiandao-today/qiandao/'
license=('MIT')
depends=('python-aiofiles' 'python-aiohttp' 'python-aiomysql' 'python-aiosqlite'
         'python-charset-normalizer' 'python-croniter' 'python-cryptography'
         'python-dateutil' 'python-faker' 'python-jinja' 'python-passlib'
         'python-pbkdf2' 'python-pycryptodome' 'python-pycurl' 'python-pysocks'
         'python-pytz' 'python-redis' 'python-requests' 'python-sqlalchemy1.4'
         'python-tornado' 'python-u-msgpack' 'tzdata')
makedepends=('git')
optdepends=('python-ddddocr: OCR support for captcha recognition')
backup=('etc/qiandao/config.py')
source=('qiandao::git+https://github.com/qiandao-today/qiandao.git'
        'qiandao.service'
        'sysusers.d'
        'tmpfiles.d')
install='qiandao-git.install'
sha512sums=('SKIP'
            '3a2f4cc6471de0e7bd4a34d0110a4419173478f277e0aa4da67991b32bbc79043c4e08c882771ce33923aa9be36517cf76625955363dc4c05312dc7cd4208e3e'
            '8ddb47713d903da752a8c601df4b9cc46b3ce23ce922436f27dac9b54fb36164b1d4f2026c13f7508e56c9f2df532c7ccc2f986e5007d3a76b04d82f4a983a4c'
            'd54af81eddb8ceb490e099258305c3f4687b80279acb2e22139cb0793b8a7d2261ac8b5fb19f36c4070ac7743bde7a3bb4808ca707c81310abd1af6c24334cd5')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  sed -i 's#os.path.dirname(__file__), "config", "database.db"#os.getcwd(), "database.db"#' config.py
  grep -q 'os.getcwd(), "database.db"' config.py
  sed -i 's#os.path.dirname(__file__)#os.path.dirname(os.path.realpath(__file__))#' run.py
  grep -q 'os.path.realpath(__file__)' run.py
  sed -i '1i #!/usr/bin/python' run.py chrole.py
  chmod +x run.py chrole.py qd.py
}

build() {
  python -m compileall -q "${_pkgname}"
}

package() {
  install -dm755 "${pkgdir}/usr/share/webapps/${_pkgname}"
  cp -a "${_pkgname}"/* "${pkgdir}/usr/share/webapps/${_pkgname}"
  install -Dm644 "${_pkgname}/config.py" "${pkgdir}/etc/qiandao/config.py"
  ln -sf "/etc/qiandao/config.py" "${pkgdir}/usr/share/webapps/${_pkgname}/config.py"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/${_pkgname}/run.py" "${pkgdir}/usr/bin/qiandao-run"
  ln -s "/usr/share/webapps/${_pkgname}/chrole.py" "${pkgdir}/usr/bin/qiandao-chrole"
  ln -s "/usr/share/webapps/${_pkgname}/qd.py" "${pkgdir}/usr/bin/qiandao-cli"

  install -Dm644 qiandao.service "${pkgdir}/usr/lib/systemd/system/qiandao.service"
  install -Dm644 tmpfiles.d "${pkgdir}/usr/lib/tmpfiles.d/qiandao.conf"
  install -Dm644 sysusers.d "${pkgdir}/usr/lib/sysusers.d/qiandao.conf"
}
