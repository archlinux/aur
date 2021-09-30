1.3.2
=====

* Search now uses KMD by default instead of dichotomic search (massive speed gain). Many thanks to @Keija for the implementation. Go to https://github.com/tariqdaouda/pyGeno/pull/34 for details and benchmarks.

1.3.1
=====

* CSVFile: fixed bug when slice start was None
* CSVFile: Better support for string separator
* AGN SNPs Quality cast to float by importer
* Travis integration
* Minor CSV parser updates

1.3.0
=====

* CSVFile will now ignore empty lines and comments

* Added synonymousCodonsFrequencies

1.2.9
=====

* It is no longer mandatory to set the whole legend of CSV file at initialization. It can figure it out by itself

* Datawraps can now be uncompressed folders

* Explicit error message if there's no file name manifest.ini in datawrap


1.2.8
=====

* Fixed BUG that prevented proper initialization and importation

1.2.5
=====

* BUG FIX: Opening a lot of chromosomes caused mmap to die screaming

* Removed core indexes. Sqlite sometimes chose them instead of user defined positional indexes, resulting un slow queries

* Doc updates

1.2.3
=====

* Added functions to retrieve the names of imported snps sets and genomes

* Added remote datawraps to the boostrap module that can be downloaded from pyGeno's website or any other location

* Added a field uniqueId to AgnosticSNPs

* Changed all latin datawrap names to english

* Removed datawrap for dbSNP GRCh37

1.2.2
=====

* Updated pypi package to include bootstrap datawraps

1.2.1
=====

* Fixed tests

1.2.0
=====
* BUG FIX: get()/iterGet() now works for SNPs and Indels

* BUG FIX: Default SNP filter used to return unwanted Nones for insertions

* BUG FIX: Added cast of lines to str in VCF and CasavaSNP parsers. Sometimes unicode caracters made the translation bug  

* BUG FIX: Corrected a typo that caused find in Transcript to recursively die 

* Added a new AgnosticSNP type of SNPs that can be easily made from the results of any snp caller. To make for the loss of support for casava by illumina. See SNP.AgnosticSNP for documentation

* pyGeno now comes with the murine reference genome GRCm38.78

* pyGeno now comes with the human reference genome GRCh38.78, GRCh37.75 is still shipped with pyGeno but might be in the upcoming versions

* pyGeno now comes with a datawrap for common dbSNPs human SNPs (SNP_dbSNP142_human_common_all.tar.gz)

* Added a dummy AgnosticSNP datawrap example for boostraping

* Changed the interface of the bootstrap module

* CSV Parser has now the ability to stream directly to a file


1.1.7
=====

* BUG FIX: looping through CSV lines now works

* Added tests for CSV

1.1.6
=====

* BUG FIX: find in BinarySequence could not find some subsequences at the tail of sequence

1.1.5
=====

* BUG FIX in default SNP filter

* Updated description

1.1.4
=====

* Another BUG FIX in progress bar

1.1.3
=====

* Small BUG FIX in the progress bar that caused epochs to be misrepresented

* 'Specie' has been changed to 'species' everywhere. That breaks the database the only way to fix it is to redo all importations

1.1.2
=====

* Genome import is now much more memory efficient

* BUG FIX: find in BinarySequence could not find subsequences at the tail of sequence

* Added a built-in datawrap with only chr1 and y

* Readme update with more infos about importation and link to doc
 
1.1.1
=====

Much better SNP filtering interface
------------------------------------
Easier and much morr coherent:

* SNP filtering has now its own module

* SNP Filters are now objects

* SNP Filters must return SequenceSNP, SNPInsert, SNPDeletion or None objects

1.0.0
=====
Freshly hatched

