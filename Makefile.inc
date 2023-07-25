#
#  This file is part of MUMPS 5.6.1, released
#  on Tue Jul 11 07:51:28 UTC 2023
#
# These settings for a PC under Debian/linux with standard packages :
# metis (parmetis), scotch (ptscotch), openmpi, gfortran

# packages installation: 
# apt-get install libmetis-dev libparmetis-dev libscotch-dev libptscotch-dev libatlas-base-dev openmpi-bin libopenmpi-dev liblapack-dev libscalapack-openmpi-dev

# Begin orderings
#LSCOTCHDIR = /usr/lib
#ISCOTCH   = -I/usr/include/scotch

#LSCOTCH   = -L$(LSCOTCHDIR) -lptesmumps -lptscotch -lptscotcherr
#LSCOTCH   = -L$(LSCOTCHDIR) -lesmumps -lscotch -lscotcherr

LPORDDIR = $(topdir)/PORD/lib/
IPORD    = -I$(topdir)/PORD/include/
LPORD    = -L$(LPORDDIR) -lpord

#LMETISDIR = /usr/lib
#IMETIS    = -I/usr/include/
#IMETIS    = -I/usr/include/metis

# LMETIS    = -L$(LMETISDIR) -lparmetis -lmetis
#LMETIS    = -L$(LMETISDIR) -lmetis

# Corresponding variables reused later
#ORDERINGSF = -Dmetis -Dpord -Dparmetis -Dscotch -Dptscotch
ORDERINGSF = -Dpord
ORDERINGSC  = $(ORDERINGSF)

LORDERINGS = $(LPORD)
IORDERINGSF = $(ISCOTCH)
IORDERINGSC = $(IPORD)
# End orderings
################################################################################

PLAT    =
LIBEXT_SHARED  = .so
SONAME = -soname
FPIC_OPT = -fPIC
# Adapt/uncomment RPATH_OPT to avoid modifying
# LD_LIBRARY_PATH in case of shared libraries
# RPATH_OPT = -Wl,-rpath,/path/to/MUMPS_x.y.z/lib/
LIBEXT  = .a
OUTC    = -o 
OUTF    = -o 
RM = /bin/rm -f
CC = gcc
FC = gfortran
FL = gfortran
AR = ar vr 
RANLIB = ranlib
LAPACK = -llapack



INCSEQ = -I$(topdir)/libseq
LIBSEQ  = $(LAPACK) -L$(topdir)/libseq -lmpiseq

LIBBLAS = -lblas
LIBOTHERS = -lpthread

#Preprocessor defs for calling Fortran from C (-DAdd_ or -DAdd__ or -DUPPER)
CDEFS   = -DAdd_

#Begin Optimized options
#OPTF    = -O -fopenmp
# Use the line below if your version of gfortran is >= 10
OPTF    = -O -fallow-argument-mismatch
OPTL    = -O
OPTC    = -O
#End Optimized options
 
INCS = $(INCSEQ)
LIBS = $(LIBSEQ)
LIBSEQNEEDED = libseqneeded
