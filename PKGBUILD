# Maintainer: Mikhail felixoid Shiryaev <mr dot felixoid on gmail>
# Maintainer: Mike Javorski (javmorin) <mike.javorski@gmail.com>

#
# Note: To reduce weight, this package only includes type info for the
# upstream designated "essential" services and those requested by
# users. This can easily be adjusted for your use by modifying the
# _services list.
#

_services=(
  apigateway cloudformation dynamodb ec2 ecr iam kinesis lambda rds s3 schemas secretsmanager signer sqs stepfunctions sts xray
)
for _svc in "${_services[@]}"; do
  _svc_packages+=("python-mypy-boto3-$_svc")
done
_boto3_version=1.35.36    ## NOTE: This should match the version of the python-boto3 package to avoid API mis-match
_mypy_boto3_builder_version=8.1.4

pkgname=python-boto3-stubs
pkgver=${_boto3_version}
pkgrel=3
pkgdesc='Type annotations and code completion for (some) boto3 components (Essentials+Requested)'
arch=('any')
url="https://pypi.org/project/boto3-stubs"
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-pip')
depends=('python-boto3' 'python-botocore-stubs')
license=('MIT')

provides=( $pkgname ${_svc_packages[@]} )
conflicts=( $pkgname ${_svc_packages[@]} )

build() {
  ### It's very hacky approach, but mypy_boto3_builder requires quite a lot of additional packages
  ### so I'd rather use virtual env to get it in place
  mkdir -p "$srcdir/mypy_boto3_builder"
  cd "$srcdir/mypy_boto3_builder"
  python -m venv venv
  source venv/bin/activate
  python -m pip install "boto3==${_boto3_version}" "mypy_boto3_builder==${_mypy_boto3_builder_version}"
  rm -rf mypy_boto3_output
  python -m mypy_boto3_builder mypy_boto3_output --no-smart-version --product boto3 boto3-services --build-version ${_boto3_version} --services ${_services[@]}
  deactivate
  cd "$srcdir/mypy_boto3_builder/mypy_boto3_output"
  rm -fr boto3_stubs_lite_package
  for dir in *package; do
    cd "$dir"
    python -m build --wheel --no-isolation
    cd ..
  done
}

package() {
  cd "$srcdir/mypy_boto3_builder/mypy_boto3_output"
  for f in */dist/*.whl; do
    python -m installer --destdir="$pkgdir" --prefix=/usr "$f"
  done
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp boto3_stubs_package/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}
