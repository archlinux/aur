# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>

_name=datasets
pkgname=python-tensorflow-$_name
pkgver=4.9.4
pkgrel=1
pkgdesc='tensorflow/datasets is a library of datasets ready to use with TensorFlow.'
arch=(any)
url='https://github.com/tensorflow/datasets'
license=(Apache-2.0)
depends=('python>=3.10' python-{absl,click,dm-tree,etils,immutabledict,importlib_resources,numpy,promise,'protobuf>=3.20',psutil,pyarrow,'requests>=2.19.0',tensorflow-metadata,termcolor,toml,tqdm,wrapt})
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-{conllu,dill,jax,jupyter-core,pandas,pydub,pytest,pytest-shard,pytest-xdist,tensorflow-io,yaml})
optdepends=(
    'python-scipy: for aflw2k3d, duke_ultrasound, imagenet2012_corrupted, svhn, the300w_lp'
    # 'python-apache-beam: for beir, c4, c4_wsrs, wiki_dialog, wikipedia'
    'python-gcsfs: for ble_wind_field'
    'python-zarr: for ble_wind_field'
    'python-gcld3: for c4'
    'python-langdetect: for c4'
    'python-nltk: for c4'
    'python-tldextract: for c4'
    'python-matplotlib: for cats_vs_dogs'
    'python-pillow: for colorectal_histology, wider_face'
    'python-pydub: for common_voice, groove, gtzan, librispeech'
    'python-scikit-image: for eurosat, imagenet2012_corrupted'
    'python-tifffile: for eurosat'
    'python-imagecodecs: for eurosat'
    # 'python-pretty-midi: for groove'
    'python-opencv: for imagenet2012_corrupted'
    # 'python-tensorflow-io: for lsun'
    # 'python-crepe: for nsynth'
    'python-librosa: for nsynth'
    'python-scikit-learn: for nsynth'
    'python-pandas: for ogbg_molpcba, pet_finder, smartwatch_gestures'
    'python-networkx: for ogbg_molpcba'
    'python-h5py: for robonet'
    # 'python-envlogger: for locomotion, robosuite_panda_pick_place_can'
    'python-mwparserfromhell: for wikipedia'
    'python-mwxml: for wikipedia'
    'python-beautifulsoup4: for wsc273'
    'python-lxml: for wsc273'
    'python-pycocotools: for youtube_vis'
)
source=("$url/archive/v$pkgver.tar.gz"
        get_optdepends.py)
b2sums=('69136372b2c22b9a85abde82f17f9429cad7f44fa2b823c9d3fbbc520a9e866cd5dfbff2a6c7288ea30336a504842da53d301d13f8e8fb69cb737f1d7f03f11f'
        '3148fd6187ca7ccf7fd1834501b6fde3df94be20a3af97acff8ed67c3aea666c5300e0718fdccd91dbf1ae2bac3da435313de984648e507c62bfc6345c05c3b3')

prepare() {
    cd $_name-$pkgver
    mv -vf tensorflow_datasets/{version_stable,version}.py
}

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

# Collect tests to check for missing dependencies. Actually running tests takes too much time.
# Skipped tests: https://github.com/tensorflow/datasets/blob/v4.6.0/.github/workflows/pytest.yml#L71-L77
# Two other skipped tests: needs apache_beam
# check() {
#     cd $_name-$pkgver
#     pytest --collect-only \
#         --ignore="tensorflow_datasets/audio/nsynth_test.py" \
#         --ignore="tensorflow_datasets/core/features/features_test.py" \
#         --ignore="tensorflow_datasets/testing/test_utils.py" \
#         --ignore="tensorflow_datasets/image/lsun_test.py" \
#         --ignore="tensorflow_datasets/image_classification/imagenet2012_corrupted_test.py" \
#         --ignore="tensorflow_datasets/scripts/documentation/build_api_docs_test.py" \
#         --ignore="tensorflow_datasets/core/dataset_builder_beam_test.py" \
#         --ignore="tensorflow_datasets/core/split_builder_test.py"
# }

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
