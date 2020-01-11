# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Mr. Outis <mroutis@protonmail.com>

pkgname=dvc
pkgver=0.80.0
pkgrel=2
pkgdesc="Open-source version control system for data science projects"
arch=('any')
license=('Apache')
url="https://github.com/iterative/${pkgname}"
depends=('python' 'python-appdirs' 'python-dateutil'
         'python-colorama' 'python-configobj'
         'python-distro' 'python-flufl-lock' 'python-funcy'
         'python-gitdb' 'python-gitpython' 'python-humanize'
         'python-inflect' 'python-jsonpath-ng' 'python-packaging'
         'python-pathspec' 'python-ply' 'python-pyasn1'
         'python-yaml' 'python-requests' 'python-ruamel-yaml'
         'python-setuptools' 'python-shortuuid' 'python-tqdm'
         'python-treelib' 'python-voluptuous' 'python-zc.lockfile')
# Deps to upload on AUR: python-nanotime, python-grandalf, python-shortuuid, python-ruamel-yaml, python-ntfsutils
optdepends=('python-google-cloud-storage: support for Google Cloud'
            'python-google-api-python-client: support for GDrive'
            'python-pydrive: support for GDrive'
            'python-boto3: support for AWS S3 remote'
            'python-paramiko: support for SSH remote'
            'python-azure-storage: support for Azure remote'
            'python-oss2: support for Aliyun Object Storage Service (OSS)'
            'python-pyarrow: support for HDFS remote')
# OptDeps to upload on AUR: python-oss2, python-google-cloud-storage
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "remove-configparser.patch"
        "https://files.pythonhosted.org/packages/source/g/grandalf/grandalf-0.6.tar.gz"
        "https://files.pythonhosted.org/packages/source/n/ntfsutils/ntfsutils-0.1.4.tar.gz"
        "https://files.pythonhosted.org/packages/source/n/nanotime/nanotime-0.5.2.tar.gz")
sha256sums=('fd3ffcc72937cf81045b9868a711f876e1227bad7e8eb4d93386d49892fd9bcd'
            '889a8d26cc36a8578033bac1184b69024419c21cd49508c7541b5c24d3b35ec8'
            '7471db231bd7338bc0035b16edf0dc0c900c82d23060f4b4d0c4304caedda6e4'
            '50c058ce3371a819606ff29e914e6555c4d6c2527bff0cd0ed20af5947703118'
            'c7cc231fc5f6db401b448d7ab51c96d0a4733f4b69fabe569a576f89ffdf966b')


prepare() {
  # Remove configparser from setup.py
  # Is a backport of python 3.7 configparser for python 2.x
  patch -Np0 -i remove-configparser.patch
}

build() {
  # Dependencies
  cd "${srcdir}/grandalf-0.6"
  python setup.py build

  cd "${srcdir}/ntfsutils-0.1.4"
  python setup.py build

  cd "${srcdir}/nanotime-0.5.2"
  python setup.py build

  # Package
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build

}

package() {
  # Dependencies
  cd "${srcdir}/grandalf-0.6"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build

  cd "${srcdir}/ntfsutils-0.1.4"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build

  cd "${srcdir}/nanotime-0.5.2"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build

  # Package
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 scripts/completion/dvc.zsh \
    "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"

  install -Dm644 scripts/completion/dvc.bash \
    "${pkgdir}/etc/bash_completion.d/${pkgname}"
}
