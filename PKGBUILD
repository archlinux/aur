# Maintainer: Luke Labrie-Cleary <luke.cleary@copenhagenatomics.com>
pkgname=nuclear-data
pkgver=0
pkgrel=1
pkgdesc="Evaluated nuclear data files for OpenMC"
arch=(x86_64)

# openmc.org supported nuclear data
_endfb71="https://anl.box.com/shared/static/9igk353zpy8fn9ttvtrqgzvw1vtejoz6.xz"
_endfb80="https://anl.box.com/shared/static/uhbxlrx7hvxqw27psymfbhi7bx7s6u6a.xz"
_jeff33="https://anl.box.com/shared/static/4jwkvrr9pxlruuihcrgti75zde6g7bum.xz"
_fendl32="https://anl.box.com/shared/static/3cb7jetw7tmxaw6nvn77x6c578jnm2ey.xz"
_chain_endfb71_pwr="https://anl.box.com/shared/static/os1u896bwsbopurpgas72bi6aij2zzdc.xml"
_chain_endfb71_fast="https://anl.box.com/shared/static/9058zje1gm0ekd93hja542su50pccvj0.xml"
_chain_casl_pwr="https://anl.box.com/shared/static/3nvnasacm2b56716oh5hyndxdyauh5gs.xml"
_chain_casl_sfr="https://anl.box.com/shared/static/9fqbq87j0tx4m6vfl06pl4ccc0hwamg9.xml"


license=()
makedepends=(
	git
	python
	cmake
)
depends=(
	wget
	)
provides=("${pkgname%}")


build() {
declare -a _csChosen=()
declare -a _depChosen=()
_path_set=false
_cpath=""

_csChoices=(endfb71 endfb80 jeff33 fendl32)
_depChoices=(chain_endfb71_pwr chain_endfb71_fast chain_casl_pwr chain_casl_sfr)

# cross sections
echo "cross-section data:"
for ((i=0;i<4;i++)); do
	num=$(( i+1 ))
	printf '%s %s\n' "$num.) ${_csChoices[i]}"
done
echo "data to download: (eg: '1 2 3', '1-4') default [1]"
IFS=', ' read -a ranges_cs

#depletion
echo "depletion data:"
for ((i=0;i<4;i++)); do
	num=$(( i+1 ))
	printf '%s %s\n' "$num.) ${_depChoices[i]}"
done
echo "data to download: (eg: '1 2 3', '1-4') default[1]"
IFS=', ' read -a ranges_dep

# parse choices
# default choice and cross-section path is the first choice
if [[ ${#ranges_cs[@]} == 0 ]]; then
	ranges_cs+=1
fi
if [[ ${#ranges_dep[@]} == 0 ]]; then
	ranges_dep+=1
fi
for range in "${ranges_cs[@]}"; do
        IFS=- read start end <<< "$range"
        [ -z "$start" ] && continue
        [ -z "$end" ] && end=$start
        for (( i=start ; i <= end ; i++ )); do
                if [[ $i = 1 ]]; then
					_csChosen+=(${_endfb71})
					if [ !path_set ]; then
						_cpath="endfb-vii.1-hdf5"
						_path_set=true
					fi
				elif [[ $i = 2 ]]; then
					_csChosen+=(${_endfb80}) 
					if [ !path_set ]; then
						_cpath="endfb-viii.0-hdf5"
						_path_set=true
					fi
				elif [[ $i = 3 ]]; then
					_csChosen+=(${_jeff33}) 
					if [ !path_set ]; then
						_cpath="jeff-3.3-hdf5"
						_path_set=true
					fi
				else
					_csChosen+=(${_fendl32})
					if [[ !path_set ]]; then
						_cpath="fendl-3.2-hdf5"
						_path_set=true
					fi
				fi	
         done
done

for range in "${ranges_dep[@]}"; do
        IFS=- read start end <<< "$range"
        [ -z "$start" ] && continue
        [ -z "$end" ] && end=$start
        for (( i=start ; i <= end ; i++ )); do
                if [[ $i=1 ]]; then
					_depChosen+=($_chain_endfb71_pwr) 
				elif [[ $i=2 ]]; then
					_depChosen+=($_chain_endfb71_fast)
				elif [[ $i=3 ]]; then
					_depChosen+=($_chain_casl_pwr) 
				else
					_depChosen+=($_chain_casl_sfr) 
				fi	
         done
done

cd $srcdir	
# since source() does not support multiple tarballs, sources need to be fetched manually
lenCS=${#_csChosen[@]}
for ((i=0;i<$lenCS;i++)); do
	wget ${_csChosen[i]}
done

lenD=${#_depChosen[@]}
for ((i=0;i<$lenD;i++)); do
	wget ${_depChosen[i]}
done

for entry in "$PWD"/*
do	
	if [[ $entry == *.zst ]] || [[ $entry == *.xz ]]
	then
	  tar -xvf $entry
	fi
done

echo -e "\nINFO: depletion data (.xml) saved at /opt/${pkgname}"
echo -e "INFO: nuclear data saved to OPENMC_CROSS_SECTIONS=/opt/${pkgname}/$_cpath/cross_sections.xml,\
to make this data available at runtime for OpenMC set OPENMC_CROSS_SECTIONS \
environment variable to this path via: export OPENMC_CROSS_SECTIONS=/opt/${pkgname}/$_cpath/cross_sections.xml\n"
}

package(){
# put data files in standard location
mkdir ${pkgdir}/opt
mkdir ${pkgdir}/opt/${pkgname}
cd $srcdir
mv *.xml* *hdf5 ${pkgdir}/opt/${pkgname}

# permission fixes 
chmod -R go+r "${pkgdir}/opt"
chmod -R 755 "${pkgdir}/opt/${pkgname}"
}
