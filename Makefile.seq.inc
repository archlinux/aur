#
#  This file is part of MUMPS 5.1.1, released
#  on Mon Mar 20 14:34:33 UTC 2017
#
# These settings for a PC under Debian/linux with standard packages :
# metis (parmetis), scotch, gfortran

# packages installation : 
# apt-get install libmetis-dev libscotch-dev libatlas-base-dev lapack-dev

# Adapted by Drew Parsons from Make.inc/Makefile.debian.SEQ, based on
# Adam Powell and Roberto C. Sanchez' earlier adaptations from Makefile.gfortran.seq and Makefile.G95.seq

# Begin orderings
LSCOTCHDIR = /usr/lib
ISCOTCH   = -I/usr/include/scotch

#LSCOTCH   = -L$(LSCOTCHDIR) -lptesmumps -lptscotch -lptscotcherr
LSCOTCH   = -L$(LSCOTCHDIR) -lesmumps -lscotch -lscotcherr

LPORDDIR = $(topdir)/PORD/lib/
IPORD    = -I$(topdir)/PORD/include/
LPORD    = -L$(LPORDDIR) -lpord

LMETISDIR = /usr/lib 
#IMETIS    = -I/usr/include/parmetis
IMETIS    = -I/usr/include/metis

# LMETIS    = -L$(LMETISDIR) -lparmetis -lmetis
LMETIS    = -L$(LMETISDIR) -lmetis

# Corresponding variables reused later
#ORDERINGSF = -Dmetis -Dpord -Dparmetis -Dscotch -Dptscotch
ORDERINGSF = -Dmetis -Dpord -Dscotch
ORDERINGSC  = $(ORDERINGSF)

LORDERINGS = $(LMETIS) $(LPORD) $(LSCOTCH)
IORDERINGSF = $(ISCOTCH)
IORDERINGSC = $(IMETIS) $(IPORD) $(ISCOTCH)
# End orderings
################################################################################

PLAT    =
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

MPIFLIB = -L$(topdir)/libseq -lmpiseq$(PLAT)

INCSEQ = -I$(topdir)/libseq
LIBSEQ  = $(LAPACK) $(MPIFLIB)

LIBBLAS = -lblas
LIBOTHERS = -lpthread

#Preprocessor defs for calling Fortran from C (-DAdd_ or -DAdd__ or -DUPPER)
CDEFS   = -DAdd_

#Begin Optimized options
OPTF    := -O -DPORD_INTSIZE64 -fallow-argument-mismatch -Dintel_ # -fopenmp
OPTL    := -O # -fopenmp
OPTC    := -O -DPORD_INTSIZE64 # -fopenmp
#End Optimized options

INCS = $(INCSEQ)
LIBS = $(LIBSEQ)
LIBSEQNEEDED = libseqneeded
