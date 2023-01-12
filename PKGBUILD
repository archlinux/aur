# Maintainer: Mikhail felixoid Shiryaev <mr dot felixoid on gmail>


pkgname=python-boto3-stubs
pkgver=1.24.96
pkgrel=1
pkgdesc='Type annotations and code completion for botocore package'
arch=('any')
url="https://pypi.org/project/botocore-stubs"
makedepends=('python-setuptools' 'python-boto3' 'python-botocore')
depends=('python' 'python-boto3' 'python-botocore')
license=('MIT')
_mypy_boto3_builder='mypy_boto3_builder==7.12.3'

build() {
  ### It's very hacky approach, but mypy_boto3_builder requires quite a lot of additional packages
  ### so I'd rather use virtual env to get it in place
  mkdir -p "$srcdir/mypy_boto3_builder"
  cd "$srcdir/mypy_boto3_builder"
  python -m venv venv
  source venv/bin/activate
  python -m pip install "$_mypy_boto3_builder"
  rm -rf mypy_boto3_output
  python -m mypy_boto3_builder mypy_boto3_output --build-version 1.24.96 \
    --services cloudformation dynamodb ec2 lambda rds s3 sqs
  deactivate
}

package() {
  cd "$srcdir/mypy_boto3_builder/mypy_boto3_output"
  for dir in boto3_stubs_package mypy_boto3*package; do
    cd "$dir"
    python setup.py install --root="${pkgdir}" --prefix=/usr
    cd ..
  done
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp boto3_stubs_package/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}
