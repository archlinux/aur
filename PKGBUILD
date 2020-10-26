# Maintainer: Alexey Nurmukhametov [nurmukhametov] <echo YWxleEBudXJtdWtoYW1ldG92LnJ1Cg== | base64 -d>

_version_major=1
_version_minor=0
_version_revision=1
pkgname=mindspore-lite
_pkgname=mindspore
pkgver="${_version_major}.${_version_minor}.${_version_revision}"
pkgrel=1
pkgdesc='Lightweright machine learning inference framework'
url='https://www.mindspore.cn/en'
arch=('x86_64')
license=('Apache')
depends=('protobuf' 'flatbuffers' 'gmock' 'eigen' 'cmake')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/mindspore-ai/${_pkgname}/archive/v${pkgver}.tar.gz
  googletest.tar.gz::https://github.com/google/googletest/archive/release-1.8.0.tar.gz
)
sha512sums=('159c5e0ee00cd3c72d88279bed206f20406d40a7b97e9e22d43755ba269d883d4757e660315aa70794231ae9f06f286f50e7dbb6460128ea7f8ec41d64b2b5cc'
  '1dbece324473e53a83a60601b02c92c089f5d314761351974e097b2cf4d24af4296f9eb8653b6b03b1e363d9c5f793897acae1f0c7ac40149216035c4d395d9d'
)

prepare() {
  mv googletest-*/* "${_pkgname}-${pkgver}/third_party/googletest/"
}

gene_flatbuffer() {
  FLAT_DIR="${_pkgname}-${pkgver}/mindspore/lite/schema"
  mkdir -p "${FLAT_DIR}/inner"
  find ${FLAT_DIR} -name "*.fbs" -print0 | xargs -0 flatc -c -b -o "${FLAT_DIR}"
  find ${FLAT_DIR} -name "*.fbs" -print0 | xargs -0 flatc -c -b --reflect-types --gen-mutable --reflect-names --gen-object-api -o "${FLAT_DIR}/inner"
  FLAT_DIR="${_pkgname}-${pkgver}/mindspore/lite/tools/converter/parser/tflite"
  find ${FLAT_DIR} -name "*.fbs" -print0 | xargs -0 flatc -c -b --reflect-types --gen-mutable --reflect-names --gen-object-api -o "${FLAT_DIR}/"
}

gene_protobuf() {
    PROTO_SRC_DIR="${_pkgname}-${pkgver}/mindspore/lite/tools/converter/parser/caffe"
    find ${PROTO_SRC_DIR} -name "*.proto" -print0 | xargs -0 protoc -I"${PROTO_SRC_DIR}" --cpp_out="${PROTO_SRC_DIR}"
    PROTO_SRC_DIR="${_pkgname}-${pkgver}/mindspore/lite/tools/converter/parser/onnx"
    find ${PROTO_SRC_DIR} -name "*.proto" -print0 | xargs -0 protoc -I"${PROTO_SRC_DIR}" --cpp_out="${PROTO_SRC_DIR}"
}

build() {
  gene_flatbuffer
  gene_protobuf

  cd "${_pkgname}-${pkgver}"
  mkdir build-lite
  cd build-lite
  cmake ../mindspore/lite/ -DBUILD_DEVICE=on -DPLATFORM_ARM64=off \
    -DBUILD_CONVERTER=on -DSUPPORT_TRAIN=off  -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr -DSUPPORT_GPU=off -DBUILD_MINDDATA=off \
    -DOFFLINE_COMPILE=off \
    -DMS_VERSION_MAJOR=${_version_major} \
    -DMS_VERSION_MINOR=${_version_minor} \
    -DMS_VERSION_REVISION=${_version_revision}

  make
}

package() {
  cd "${_pkgname}-${pkgver}/build-lite"

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib"
  install -t "${pkgdir}/usr/lib/" ./src/libmindspore-lite.so ./src/libmindspore-lite.a

  install -T ./tools/converter/converter_lite "${pkgdir}/usr/bin/ms-lite-converter"
  install -T ./tools/benchmark/benchmark "${pkgdir}/usr/bin/ms-lite-benchmark"
  install -T ./tools/time_profiler/timeprofiler "${pkgdir}/usr/bin/ms-lite-profiler"

  INCLUDE_DIR="${pkgdir}/usr/include/mindspore-lite"
  install -d "${INCLUDE_DIR}"
  install -m 644 -t "${INCLUDE_DIR}" ../mindspore/lite/include/*
  install -d "${INCLUDE_DIR}/ir/dtype"
  install -m 644 ../mindspore/core/ir/dtype/type_id.h "${INCLUDE_DIR}/ir/dtype"
  install -d "${INCLUDE_DIR}/schema"
  install -m 644 -t "${INCLUDE_DIR}/schema" ../mindspore/lite/schema/model_generated.h ../mindspore/lite/schema/ops_generated.h
}

# vim:set ts=2 sw=2 et:
