# input Makefile
# DO NOT EDIT!
# Run ./configure to produce the Makefile instead.

# ------------------------------ global variables --------------------------

ALL       = c-all cpp-void f90-void healpy-void 
TESTS     = c-test cpp-void f90-void healpy-void 
CLEAN     = c-clean cpp-void f90-void healpy-void 
TIDY      = c-tidy cpp-void f90-void healpy-void 
DISTCLEAN = c-distclean cpp-void f90-void healpy-void 

RM	= rm -f

# ------------------------------ variables for F90 --------------------------
HEALPIX=
F90_BINDIR	=
F90_INCDIR	=
F90_LIBDIR	=
FITSDIR	= 
LIBFITS	= 
F90_BUILDDIR    =

F90_FFTSRC  = 
F90_ADDUS   = 

F90_PARALL  =

F90_FC	= 
F90_FFLAGS	= 
F90_CC	= 
F90_CFLAGS	= 
F90_LDFLAGS	=
F90_AR      = 
F90_PPFLAGS =
F90_I8FLAG  = 
F90_LIBSUFFIX = 
F90_FLAGNAMELIB =

F90_PGFLAG  =
F90_PGLIBS  =

F90_MOD     =
F90_MODDIR  =

F90_OS	=

F90_MKFLAGS	= FC="$(F90_FC)" FFLAGS="$(F90_FFLAGS)" LDFLAGS="$(F90_LDFLAGS)" \
	CC="$(F90_CC)" CFLAGS="$(F90_CFLAGS)" MOD="$(F90_MOD)" MODDIR=$(F90_MODDIR) \
	OS="$(F90_OS)" HEALPIX=$(HEALPIX) LIBSUFFIX="$(F90_LIBSUFFIX)"\
	LIBDIR=$(F90_LIBDIR) INCDIR=$(F90_INCDIR) BINDIR=$(F90_BINDIR) BUILDDIR=$(F90_BUILDDIR) \
	FFTSRC=$(F90_FFTSRC) ADDUS="$(F90_ADDUS)" PARALL="$(F90_PARALL)" AR="$(F90_AR)" FLAGNAMELIB="$(F90_FLAGNAMELIB)"\
	PPFLAGS="$(F90_PPFLAGS)" PGFLAG="$(F90_PGFLAG)" PGLIBS="$(F90_PGLIBS)" FI8FLAG="$(F90_I8FLAG)"


# ------------------------------ variables for C --------------------------
#
# Compiler Options
C_CC        = gcc
C_PIC       = -fPIC
C_OPT       = -O2 -Wall
#
# Where you want to install the library and header file
C_LIBDIR      = $(PWD)/lib
C_INCDIR      = $(PWD)/include
C_AR        = ar -rsv
#
# Where you have the cfitsio installation
C_WITHOUT_CFITSIO = 1
C_CFITSIO_INCDIR = /usr/local/include
C_CFITSIO_LIBDIR = /usr/local/lib
C_WLRPATH = -Wl,-R
#
# Libraries to install (static, shared, dynamic)
C_ALL     = c-static c-shared

C_MKFLAGS = CC="$(C_CC)" PIC="$(C_PIC)" OPT="$(C_OPT)" \
	LIBDIR="$(C_LIBDIR)" INCDIR="$(C_INCDIR)" AR="$(C_AR)" \
	WITHOUT_CFITSIO="$(C_WITHOUT_CFITSIO)" CFITSIO_INCDIR="$(C_CFITSIO_INCDIR)" \
	CFITSIO_LIBDIR="$(C_CFITSIO_LIBDIR)" WLRPATH="$(C_WLRPATH)" \
	RM="$(RM)" 

# ------------------------------ variables for C++ --------------------------

HEALPIX_TARGET =
EXTERNAL_CFITSIO=yes
CFITSIO_EXT_LIB=
CFITSIO_EXT_INC=
export HEALPIX_TARGET EXTERNAL_CFITSIO CFITSIO_EXT_LIB CFITSIO_EXT_INC

# ------------------------------ variables for Python healpy --------------------------

HPY_SETUP  =
HPY_PYTHON =
# ------------------------------- global rules -------------------------

all: $(ALL)


test: $(TESTS)


clean: $(CLEAN)


tidy: $(TIDY)


distclean: $(DISTCLEAN)
	$(RM) Makefile
	$(RM) Makefile_tmp
	$(RM) Makefile_bk*

# ------------------------------- F90 rules ----------------------------


f90-progs = map2gif anafast smoothing synfast ud_grade hotspot plmgen alteralm median_filter ngsims_full_sky process_mask
f90-libs  = f90-libsharp f90-modules f90-libgif

f90-all: $(f90-libs) $(f90-progs)

# itemized list instead of loop to allow parallel compiling

# libraries
f90-libsharp: 
	@cd src/f90/sharp; $(MAKE) $(F90_MKFLAGS)

f90-modules: f90-libsharp
	@cd src/f90/mod; $(MAKE) $(F90_MKFLAGS)

f90-libgif: f90-modules
	@cd src/f90/lib; $(MAKE) $(F90_MKFLAGS)

# visualization code
map2gif: $(f90-libs)
	@cd src/f90/$@; $(MAKE) $(F90_MKFLAGS)

# processing codes
anafast: $(f90-libs)
	@cd src/f90/$@; $(MAKE) $(F90_MKFLAGS)

smoothing: $(f90-libs)
	@cd src/f90/$@; $(MAKE) $(F90_MKFLAGS)

synfast: $(f90-libs)
	@cd src/f90/$@; $(MAKE) $(F90_MKFLAGS)

ud_grade: $(f90-libs)
	@cd src/f90/$@; $(MAKE) $(F90_MKFLAGS)

hotspot: $(f90-libs)
	@cd src/f90/$@; $(MAKE) $(F90_MKFLAGS)

plmgen: $(f90-libs)
	@cd src/f90/$@; $(MAKE) $(F90_MKFLAGS)

alteralm: $(f90-libs)
	@cd src/f90/$@; $(MAKE) $(F90_MKFLAGS)

median_filter: $(f90-libs)
	@cd src/f90/$@; $(MAKE) $(F90_MKFLAGS)

ngsims_full_sky: $(f90-libs)
	@cd src/f90/$@; $(MAKE) $(F90_MKFLAGS)

process_mask: $(f90-libs)
	@cd src/f90/$@; $(MAKE) $(F90_MKFLAGS)

f90-test: f90-all
	@cd test; \
	$(RM) test*; \
	$(F90_BINDIR)/synfast syn.par; \
	$(F90_BINDIR)/map2gif -inp test_map.fits -out test_map.gif -bar t -ttl 'CMB Map'; \
	$(F90_BINDIR)/smoothing smo.par; \
	$(F90_BINDIR)/map2gif -inp test_sm.fits -out test_sm.gif -bar t -ttl 'Smoothed CMB Map'; \
	$(F90_BINDIR)/ud_grade udg.par ; \
	$(F90_BINDIR)/map2gif -inp test_LOres.fits -out test_LOres.gif -bar t -ttl 'Degraded Map'; \
	$(F90_BINDIR)/hotspot hot.par ; \
	$(F90_BINDIR)/map2gif -inp test_ext.fits -out test_ext.gif -bar t -ttl 'Extrema Only Map'; \
	$(F90_BINDIR)/anafast ana.par; \
	$(F90_BINDIR)/alteralm alt.par; \
	$(F90_BINDIR)/median_filter med.par ; \
	$(F90_BINDIR)/map2gif -inp test_mf.fits -out test_mf.gif -bar t -ttl 'Median Filtered Map'; \
	$(F90_BINDIR)/sky_ng_sim ngfs.par ; \
	$(F90_BINDIR)/map2gif -inp test_ngfs.fits -out test_ngfs.gif -bar t -ttl 'Non-Gaussian Map'; \
	$(F90_BINDIR)/process_mask prmask.par ; \
	$(F90_BINDIR)/map2gif -inp test_distmask.fits -out test_distmask.gif -bar t -ttl 'Distance to mask border'; \
	echo "Healpix F90 tests done" ; \
	echo "success rate: `ls -1 test*fits | wc -l`/10"

f90-clean:
	for p in $(f90-progs) lib mod sharp; do \
	$(RM) src/f90/$$p/*.o src/f90/$$p/*.$(F90_MOD) src/f90/$$p/lib*.a src/f90/$$p/*.pc src/f90/$$p/*.pcl src/f90/$$p/*.il ; \
	done
	$(RM) -r $(F90_BUILDDIR)

f90-vclean: f90-clean
	for p in $(f90-progs); do \
	$(RM) $(F90_BINDIR)/$$p; \
	done
	$(RM) $(F90_BINDIR)/sky_ng_sim*
	$(RM) $(F90_INCDIR)/*.$(F90_MOD)
	$(RM) $(F90_INCDIR)/*.pc $(F90_INCDIR)/*.pcl
	$(RM) $(F90_LIBDIR)/*.a $(F90_LIBDIR)/*$(F90_LIBSUFFIX) $(F90_LIBDIR)/*.pc

f90-tidy: f90-vclean
	$(RM) Makefile.bak test/test*

f90-distclean: f90-tidy
	$(RM) Makefile
	$(RM) -r $(F90_BINDIR) $(F90_INCDIR) $(F90_LIBDIR)

f90-void:

# ------------------------------- C rules ----------------------------

c-all: $(C_ALL)


c-static:      # all flavors
	@cd src/C/subs; \
	$(MAKE) static  $(C_MKFLAGS)  ; \
	$(MAKE) install $(C_MKFLAGS)  ; \
	cd ../../..

c-dynamic:     # Mac OS only
	@cd src/C/subs; \
	$(MAKE) dynamic $(C_MKFLAGS) PIC="$(C_PIC)" ; \
	$(MAKE) install $(C_MKFLAGS) PIC="$(C_PIC)" ; \
	cd ../../..

c-shared:      # Other Unix/Linux
	@cd src/C/subs; \
	$(MAKE) shared  $(C_MKFLAGS) PIC="$(C_PIC)" ; \
	$(MAKE) install $(C_MKFLAGS) PIC="$(C_PIC)" ; \
	cd ../../..

c-test:    # will only test *static* library
	@cd src/C/subs; \
	$(MAKE) static  $(C_MKFLAGS)  ; \
	$(MAKE) tests   $(C_MKFLAGS)  ; \
	cd ../../..

c-clean:
	@cd src/C/subs; \
	$(MAKE) clean $(C_MKFLAGS); \
	cd ../../..

c-tidy:
	@cd src/C/subs; \
	$(MAKE) tidy $(C_MKFLAGS); \
	cd ../../..

c-distclean: 
	@cd src/C/subs; \
	$(MAKE) distclean $(C_MKFLAGS); \
	cd ../../..

c-void:

# ------------------------------- C++ rules ----------------------------

cpp-all:
	@cd src/cxx; \
	$(MAKE) ; \
	cd ../..

cpp-test: cpp-all
	@cd src/cxx;   \
	$(MAKE) test ; \
	cd ../..

cpp-clean:
	@cd src/cxx ; \
	$(MAKE) distclean; \
	cd ../..

cpp-tidy:
	@cd src/cxx ; \
	$(MAKE) distclean ; \
	cd ../..

cpp-distclean: cpp-tidy

cpp-void:

# ------------------------------- healpy rules ----------------------------

healpy-all:
	@cd src/healpy; \
	$(HPY_PYTHON) $(HPY_SETUP) build ; \
	$(HPY_PYTHON) $(HPY_SETUP) install --user --prefix=; \
	cd ../..

healpy-test: healpy-all
	@cd /tmp ; \
	$(HPY_PYTHON) -c "import pylab; import healpy; import numpy ; hpv=healpy.__version__ ; print '\n\n Welcome to Healpy %s! \n\n'%(hpv); healpy.mollview(numpy.arange(12),title='Healpy %s'%(hpv)); pylab.show()" ; \
	cd $(HEALPIX)

healpy-clean:
	@cd src/healpy ; \
	$(HPY_PYTHON) $(HPY_SETUP) clean --all ; \
	cd ../..

healpy-tidy: healpy-clean

healpy-distclean: healpy-tidy

healpy-void:
