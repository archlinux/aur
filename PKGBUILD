# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python38-moto
_pkgname=moto
# https://github.com/spulec/moto/blob/master/CHANGELOG.md
pkgver=4.0.9
pkgrel=1
pkgdesc='Moto is a library to mock out the boto library.'
arch=(any)
url='https://github.com/spulec/moto'
license=(Apache)
# NOTE: Keep the order of dependencies matching setup.py
# setup.py includes setuptools, which is a work around for missing dependencies in aws-xray-sdk [1].
# I use the correct dependency in python38-aws-xray-sdk, so python38-setuptools is not needed here.
# [1] https://github.com/spulec/moto/pull/4142
depends=(python3.8 python-boto3 python-botocore python-cryptography python-requests python-xmltodict
         python38-werkzeug python38-pytz python38-dateutil python38-responses
         python38-jinja
         # urllib3 is used by cfnresponse.py, not directly by moto - just to make namcap happy
         python38-urllib3)
# See reqquirements-test.txt, excluding pytest-cov
checkdepends=(python38-pytest python38-sure python38-freezegun python38-mock)
# Below are optional dependencies. The order matches _dep_* items in upstream `setup.py`.
# Note that _dep_python_jose_ecdsa_pin and _dep_idna are excluded as they are pins and
# not used by moto.
optdepends=(
  'python38-yaml: for apigatewayv2, cloudformation, s3 and ssm'
  'python38-jose: for apigateway, cloudformation and cognitoidp'
  'python38-openapi-spec-validator: for apigateway and cloudformation'
  # SNS and SQS still uses docker indirectly, while upstream explicitly removes them
  # https://github.com/spulec/moto/pull/4094
  'python38-docker: for awslambda, batch, cloudformation, dynamodb2 and dynamodbstreams'
  'python38-graphql-core: For appsync and cloudformation'
  'python38-jsondiff: for iotdata and cloudformation'
  'python38-aws-xray-sdk: for xray and cloudformation'
  'python38-cfn-lint: for cloudformation'
  'python38-sshpubkeys: for ec2, ebs, efs, directoryservice and cloudformation'
  'python38-pyparsing: for glue and cloudformation'
  'python38-flask: for moto_server'
  'python38-flask-cors: for moto_server'
)
checkdepends+=(python38-yaml python38-jose python38-openapi-spec-validator python38-docker
               python38-graphql-core python38-jsondiff python38-aws-xray-sdk
               python38-cfn-lint python38-sshpubkeys python38-pyparsing python38-flask python38-flask-cors)
source=("https://files.pythonhosted.org/packages/source/m/moto/moto-${pkgver}.tar.gz")
sha256sums=('ba03b638cf3b1cec64cbe9ac0d184ca898b69020c8e3c5b9b4961c1670629010')

prepare() {
  cd $_pkgname-$pkgver

  # AWS Lambda and Batch tests require docker/podman, while running docker/podman
  # in systemd-nspawn containers appears impossible without special configurations -
  # disable them altogether
  sed -i '/markers\s*=/a \ \ \ \ needs_docker: marks test which require docker' setup.cfg
  find tests \( -name '*.py' -a ! -name __init__.py \) -print0 | xargs -I % -0 bash -c '
    sed -i -E "%" \
      -e "/__future__/a import pytest" \
      -e "s/^(\s*)(@mock_batch)$/\1\2\n\1@pytest.mark.needs_docker/" \
      -e "s/^(\s*)(@mock_lambda)$/\1\2\n\1@pytest.mark.needs_docker/"
    grep __future__ "%" || sed -i "1i import pytest" "%"
  '

  # Remove upper bounds of dependencies
  sed --in-place=.orig -r 's#,?<[0-9.]+,?##;s#==([0-9.]+)#>=\1#' setup.py
  diff -u setup.py{.orig,} || true
}

build() {
  cd $_pkgname-$pkgver

  python3.8 setup.py build
}

check() {
  cd $_pkgname-$pkgver

  PYTHONDONTWRITEBYTECODE=1 TZ=UTC pytest tests -m 'not needs_docker'
}

package() {
  cd $_pkgname-$pkgver

  python3.8 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
